module Bio
  class Sequence
    class PkaData
      PKAS = {
        'dtaselect' => { 'N_TERMINUS' => 8.0,
                          'K' => 10.0,
                          'R' => 12.0,
                          'H' => 6.5,
                          'C_TERMINUS' => 3.1,
                          'D' => 4.4,
                          'E' => 4.4,
                          'C' => 8.5,
                          'Y' => 10.0
                       }.freeze,
        'emboss' => { 'N_TERMINUS' => 8.0,
                        'K' => 10.0,
                        'R' => 12.0,
                        'H' => 6.5,
                        'C_TERMINUS' => 3.1,
                        'D' => 4.4,
                        'E' => 4.4,
                        'C' => 8.5,
                        'Y' => 10.0
                      }.freeze,
        'rodwell' => { 'N_TERMINUS' => 8.0,
                        'K' => 11.5,
                        'R' => 11.5,
                        'H' => 6.0,
                        'C_TERMINUS' => 3.1,
                        'D' => 3.68,
                        'E' => 4.25,
                        'C' => 8.33,
                        'Y' => 10.07
                      }.freeze,
        'wikipedia' => { 'N_TERMINUS' => 8.2,
                         'K' => 10.54,
                         'R' => 12.48,
                         'H' => 6.04,
                         'C_TERMINUS' => 3.65,
                         'D' => 3.9,
                         'E' => 4.07,
                         'C' => 8.18,
                         'Y' => 10.47
                      }.freeze,
        'silerio' => { 'N_TERMINUS' => 8.2,
                        'K' => 10.4,
                        'R' => 12.0,
                        'H' => 6.4,
                        'C_TERMINUS' => 3.2,
                        'D' => 4.0,
                        'E' => 4.5,
                        'C' => 9.0,
                        'Y' => 10.0
                      }.freeze
      }.freeze
    end
  end
end