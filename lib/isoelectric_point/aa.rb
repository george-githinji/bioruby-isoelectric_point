module Bio
  class Sequence
    class AA
      CHARGED_GROUPS = ['K', 'R', 'H', 'D', 'E', 'C', 'Y']

      def initialize(sequence)
        raise ArgumentError.new("sequence is required") if sequence.nil? || sequence.strip == ''
        super(sequence.upcase.gsub(/\s/, ''))
      end

      # Calculate the Isoelectric Point
      # pka_name_or_set: the name of a PKA set or a custom PKA set
      # places: specify the number of decimal places the value should be rounded to.
      # loop_limit: how many iterations should be made to find the point. You should not need to tweak this.
      def calculate_iep(pka_name_or_set = 'dtaselect', places = 2, loop_limit = 100)
        loops = 0
        ph = 7.5
        step = 3.5
        begin
          current_charge = calculate_charge_at(ph, pka_name_or_set)
          if current_charge > 0
            ph += step
          else
            ph -= step
          end
          step /= 2.0
          loops += 1
          raise "Could not find a result within #{loop_limit} loops using #{pka_name_or_set.inspect}" if loops == loop_limit
        end while not iep_reached?(current_charge)
        ph.round_to_places(places)
      end

      # Calculate the charge of the sequence at a given ph
      # As a second argument you can pass the name of the PKA set or a custom PKA set
      def calculate_charge_at(ph, pka_name_or_set = 'dtaselect')
        ['K', 'R', 'H'].inject(partial_charge(select_pka(pka_name_or_set)['N_TERMINUS'], ph)) do |memo, item|
          memo += partial_charge(select_pka(pka_name_or_set)[item], ph) * charged_residue_frequencies[item]
        end -
        ['D', 'E', 'C', 'Y'].inject(partial_charge(ph, select_pka(pka_name_or_set)['C_TERMINUS'])) do |memo, item|
          memo += partial_charge(ph, select_pka(pka_name_or_set)[item]) * charged_residue_frequencies[item]
        end
      end

      private
      def iep_reached?(current_charge)
        current_charge =! nil && 0.0.round_to_places(5) == current_charge.round_to_places(5)
      end

      def charged_residue_frequencies
        @charged_residue_frequency ||= calculate_charged_residue_frequencies
      end

      def partial_charge(a, b)
        x = 10 ** (a - b)
        x / (x + 1).to_f
      end

      # Count the occurrences of the charged groups in the AA.
      # Returns a Hash where the key is the group and the value is the number of
      # occurrences in self.
      def calculate_charged_residue_frequencies
        CHARGED_GROUPS.inject(Hash.new(0)) do |memo, item|
          memo[item] = self.count(item)
          memo
        end
      end

      #
      # Select a PKA set according to the name or supply a custom set.
      # Raises ArgumentError if the name can not be mapped to a PKA set.
      # If the argument is a String it is used as a key to lookup the set,
      # if it's a Hash then it's assumed a custom set has been supplied.
      def select_pka(pka_name_or_set = 'dtaselect')
        if pka_name_or_set.is_a?(Hash)
          pka_name_or_set
        else
          set = Bio::Sequence::PkaData::PKAS[pka_name_or_set]
          raise ArgumentError.new("Set '#{pka_name_or_set}' is unknown. Please specify one of #{PkaData::PKAS.keys.join(', ')} or pass a custom set") unless set
          set
        end #if
      end #select_pka
    end #class AA
  end #class Sequence
end #module Bio