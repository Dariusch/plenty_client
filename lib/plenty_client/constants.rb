module PlentyClient
  class Constants
    AVAILABLE_LANGS = %w(de en bg fr it es tr nl pl pt nn ro da se cz ru sk cn vn).freeze

    PAYMENT_STATUS_IDS = [
      1, # Awaiting approval
      2, # Approved
      3, # Captured
      4, # Partially captured
      5, # Cancelled
      6, # Refused
      7, # Awaiting renewal
      8, # Expired
      9, # Refunded
      10, # Partially refunded
    ].freeze

    AVAILABLE_CURRENCYS = [
      'AED', # United Arab Emirates dirham
      'AUD', # Australian dollar
      'BGN', # Bulgarian lev
      'BRL', # Brazilian real
      'CAD', # Canadian dollar
      'CHF', # Swiss franc
      'CNY', # Chinese Renminbi
      'CZK', # Czech koruna
      'DKK', # Danish krone
      'EUR', # Euro
      'GBP', # Pound sterling
      'HKD', # Hong Kong dollar
      'HUF', # Hungarian forint
      'IDR', # Indonesian rupiah
      'INR', # Indian rupee
      'JPY', # Japanese yen
      'MXN', # Mexican peso
      'MYR', # Malaysian ringgit
      'NOK', # Norwegian krone
      'PHP', # Philippine peso
      'PLN', # Polish zloty
      'RON', # Romanian leu
      'RUB', # Russian ruble
      'SEK', # Swedish krona
      'THB', # Thai baht
      'TRY', # Turkish lira
      'USD', # United States dollar
      'VND', # Vietnamese dong
      'ZAR', # South African rand
    ].freeze

    AVAILABLE_UNITS = {
      'C62' => 1, # Piece
      'KGM' => 2, # Kilogram
      'GRM' => 3, # Gram
      'MGM' => 4, # Milligram
      'LTR' => 5, # Litre
      'DPC' => 6, # 12 pieces/dozen
      'OP'  => 7, # Two pack
      'BL'  => 8, # Bale
      'DI'  => 9, # Dispenser
      'BG'  => 10, # Bag
      'ST'  => 11, # Sheet
      'D64' => 12, # Block
      'PD'  => 13, # Block
      'QR'  => 14, # Quire
      'BX'  => 15, # Box
      'CL'  => 16, # Coil
      'CH'  => 17, # Container
      'TN'  => 18, # Tin
      'CA'  => 19, # Can
      'DZN' => 20, # Dozen
      'BJ'  => 21, # Bucket
      'CS'  => 22, # Case
      'Z3'  => 23, # Cask
      'BO'  => 24, # Bottle
      'OZA' => 25, # Fluid ounce
      'JR'  => 26, # Jar
      'CG'  => 27, # Cardboard box
      'CT'  => 28, # Carton
      'KT'  => 29, # Kit
      'AA'  => 30, # Ball
      'MTR' => 31, # Metre
      'MLT' => 32, # Millilitre
      'MMT' => 33, # Millimetre
      'PR'  => 34, # Pair
      'PA'  => 35, # Packet
      'PK'  => 36, # Bundle
      'D97' => 37, # Pallet/unit load
      'MTK' => 38, # Square metre
      'CMK' => 39, # Square centimetre
      'MMK' => 40, # Square millimetre
      'SCM' => 41, # Square centimetre (non-standard)
      'SMM' => 42, # Square millimetre (non-standard)
      'RO'  => 43, # Role
      'SA'  => 44, # Sack
      'SET' => 45, # Set
      'RL'  => 46, # Reel
      'EA'  => 47, # Each
      'TU'  => 48, # Tube
      'OZ'  => 49, # Ounce
      'WE'  => 50, # Wet ton
      'CMT' => 51, # Centimetre
      'INH' => 52 # Inch
    }.freeze

    AVAILABLE_COUNTRIES = {
      '' => 0, # Unknown
      'DE' => 1, # Germany
      'AT' => 2, # Austria
      'BE' => 3, # Belgium
      'CH' => 4, # Switzerland
      'CY' => 5, # Cyprus
      'CZ' => 6, # Czech Republic
      'DK' => 7, # Denmark
      'ES' => 8, # Spain
      'EE' => 9, # Estonia
      'FR' => 10, # France
      'FI' => 11, # Finland
      'GB' => 12, # United Kingdom
      'GR' => 13, # Greece
      'HU' => 14, # Hungary
      'IT' => 15, # Italy
      'IE' => 16, # Ireland
      'LU' => 17, # Luxembourg
      'LV' => 18, # Latvia
      'MT' => 19, # Malta
      'NO' => 20, # Norway
      'NL' => 21, # Netherlands
      'PT' => 22, # Portugal
      'PL' => 23, # Poland
      'SE' => 24, # Sweden
      'SG' => 25, # Singapore
      'SK' => 26, # Slovakia
      'SI' => 27, # Slovenia
      'US' => 28, # USA
      'AU' => 29, # Australia
      'CA' => 30, # Canada
      'CN' => 31, # China
      'JP' => 32, # Japan
      'LT' => 33, # Lithuania
      'LI' => 34, # Liechtenstein
      'MC' => 35, # Monaco
      'MX' => 36, # Mexico
      'IC' => 37, # Canary Islands
      'IN' => 38, # India
      'BR' => 39, # Brazil
      'RU' => 40, # Russia
      'RO' => 41, # Romania
      'EA' => 42, # Ceuta
      # 'EA' => 43, # Melilla
      'BG' => 44, # Bulgaria
      'XZ' => 45, # Kosovo
      'KG' => 46, # Kyrgyzstan
      'KZ' => 47, # Kazakhstan
      'BY' => 48, # Belarus
      'UZ' => 49, # Uzbekistan
      'MA' => 50, # Morocco
      'AM' => 51, # Armenia
      'AL' => 52, # Albania
      'EG' => 53, # Egypt
      'HR' => 54, # Croatia
      'MV' => 55, # Maldives
      'MY' => 56, # Malaysia
      'HK' => 57, # Hong Kong
      'YE' => 58, # Yemen
      'IL' => 59, # Israel
      'TW' => 60, # Taiwan
      'GP' => 61, # Guadeloupe
      'TH' => 62, # Thailand
      'TR' => 63, # Turkey
      # 'GR' => 64, # Greek Islands
      # 'ES' => 65, # Balearic Islands
      'NZ' => 66, # New Zealand
      'AF' => 67, # Afghanistan
      'AX' => 68, # Aland Islands
      'DZ' => 69, # Algeria
      'AS' => 70, # American Samoa
      'AD' => 71, # Andorra
      'AO' => 72, # Angola
      'AI' => 73, # Anguilla
      'AQ' => 74, # Antarctica
      'AG' => 75, # Antigua and Barbuda
      'AR' => 76, # Argentina
      'AW' => 77, # Aruba
      'AZ' => 78, # Azerbaijan
      'BS' => 79, # The Bahamas
      'BH' => 80, # Bahrain
      'BD' => 81, # Bangladesh
      'BB' => 82, # Barbados
      'BZ' => 83, # Belize
      'BJ' => 84, # Benin
      'BM' => 85, # Bermuda
      'BT' => 86, # Bhutan
      'BO' => 87, # Bolivia
      'BA' => 88, # Bosnia and Herzegovina
      'BW' => 89, # Botswana
      'BV' => 90, # Bouvet Island
      'IO' => 91, # British Indian Ocean Territory
      'BN' => 92, # Brunei Darussalam
      'BF' => 93, # Burkina Faso
      'BI' => 94, # Burundi
      'KH' => 95, # Cambodia
      'CM' => 96, # Cameroon
      'CV' => 97, # Cape Verde
      'KY' => 98, # Cayman Islands
      'CF' => 99, # Central African Republic
      'TD' => 100, # Chad
      'CL' => 101, # Chile
      'CX' => 102, # Christmas Island
      'CC' => 103, # Cocos Islands/Keeling Islands
      'CO' => 104, # Columbia
      'KM' => 105, # Comoros
      'CG' => 106, # Congo
      'CD' => 107, # Democratic Republic of the Congo
      'CK' => 108, # Cook Islands
      'CR' => 109, # Costa Rica
      'CI' => 110, # Ivory coast
      'CU' => 112, # Cuba
      'DJ' => 113, # Djibouti
      'DM' => 114, # Dominica
      'DO' => 115, # Dominican Republic
      'EC' => 116, # Ecuador
      'SV' => 117, # El Salvador
      'GQ' => 118, # Equatorial Guinea
      'ER' => 119, # Eritrea
      'ET' => 120, # Ethiopia
      'FK' => 121, # Falkland Islands
      'FO' => 122, # Faroe Islands
      'FJ' => 123, # Fiji
      'GF' => 124, # French Guiana
      'PF' => 125, # French Polynesia
      'TF' => 126, # French Southern and Antarctic Lands
      'GA' => 127, # Gabon
      'GM' => 128, # Gambia
      'GE' => 129, # Georgia
      'GH' => 130, # Ghana
      'GI' => 131, # Gibraltar
      'GL' => 132, # Greenland
      'GD' => 133, # Grenada
      'GU' => 134, # Guam
      'GT' => 135, # Guatemala
      'GG' => 136, # Guernsey
      'GN' => 137, # Guinea
      'GW' => 138, # Guinea-Bissau
      'GY' => 139, # Guyana
      'HT' => 140, # Haiti
      'HM' => 141, # Heard Island and McDonald Islands
      'VA' => 142, # Vatican City
      'HN' => 143, # Honduras
      'IS' => 144, # Iceland
      'ID' => 145, # Indonesia
      'IR' => 146, # Iran
      'IQ' => 147, # Iraq
      'IM' => 148, # Isle of Man
      'JM' => 149, # Jamaica
      'JE' => 150, # Jersey
      'JO' => 151, # Jordan
      'KE' => 152, # Kenya
      'KI' => 153, # Kiribati
      'KP' => 154, # Democratic People's Republic of Korea
      'KR' => 155, # Republic of Korea
      'KW' => 156, # Kuwait
      'LA' => 158, # Laos
      'LB' => 159, # Lebanon
      'LS' => 160, # Lesotho
      'LR' => 161, # Liberia
      'LY' => 162, # Libya
      'MO' => 163, # Macao
      'MK' => 164, # Macedonia
      'MG' => 165, # Madagascar
      'MW' => 166, # Malawi
      'ML' => 168, # Mali
      'MH' => 169, # Marshall Islands
      'MQ' => 170, # Martinique
      'MR' => 171, # Mauritania
      'MU' => 172, # Mauritius
      'YT' => 173, # Mayotte
      'FM' => 174, # Micronesia
      'MD' => 175, # Moldova
      'MN' => 176, # Mongolia
      'ME' => 177, # Montenegro
      'MS' => 178, # Montserrat
      'MZ' => 179, # Mozambique
      'MM' => 180, # Myanmar
      'NA' => 181, # Namibia
      'NR' => 182, # Nauru
      'NP' => 183, # Nepal
      'AN' => 184, # Netherlands Antilles
      'NC' => 185, # New Caledonia
      'NI' => 186, # Nicaragua
      'NE' => 187, # Niger
      'NG' => 188, # Nigeria
      'NU' => 189, # Niue
      'NF' => 190, # Norfolk Island
      'MP' => 191, # Northern Mariana Islands
      'OM' => 192, # Oman
      'PK' => 193, # Pakistan
      'PW' => 194, # Palau
      'PS' => 195, # Palestinian territories
      'PA' => 196, # Panama
      'PG' => 197, # Papua New Guinea
      'PY' => 198, # Paraguay
      'PE' => 199, # Peru
      'PH' => 200, # Philippines
      'PN' => 201, # Pitcairn Islands
      'PR' => 202, # Puerto Rico
      'QA' => 203, # Qatar
      'RE' => 204, # Reunion
      'RW' => 205, # Rwanda
      'SH' => 206, # Saint Helena
      'KN' => 207, # Saint Kitts and Nevis
      'LC' => 208, # Saint Lucia
      'PM' => 209, # Saint Pierre and Miquelon
      'VC' => 210, # Saint Vincent and the Grenadines
      'WS' => 211, # Samoa
      'SM' => 212, # San Marino
      'ST' => 213, # Sao Tome and Principe
      'SA' => 214, # Saudi Arabia
      'SN' => 215, # Senegal
      'RS' => 216, # Serbia
      'SC' => 217, # Seychelles
      'SL' => 218, # Sierra Leone
      'SB' => 219, # Solomon Islands
      'SO' => 220, # Somalia
      'ZA' => 221, # South Africa
      'GS' => 222, # South Georgia and the South Sandwich Islands
      'LK' => 223, # Sri Lanka
      'SD' => 224, # Sudan
      'SR' => 225, # Suriname
      'SJ' => 226, # Spitsbergen and Jan Mayen
      'SZ' => 227, # Swaziland
      'SY' => 228, # Syria
      'TJ' => 229, # Tajikistan
      'TZ' => 230, # Tanzania
      'TL' => 231, # Timor-Leste
      'TG' => 232, # Togo
      'TK' => 233, # Tokelau
      'TO' => 234, # Tonga
      'TT' => 235, # Trinidad and Tobago
      'TN' => 236, # Tunisia
      'TM' => 237, # Turkmenistan
      'TC' => 238, # Turks and Caicos Islands
      'TV' => 239, # Tuvalu
      'UG' => 240, # Uganda
      'UA' => 241, # Ukraine
      'UM' => 242, # United States Minor Outlying Islands
      'UY' => 243, # Uruguay
      'VU' => 244, # Vanuatu
      'VE' => 245, # Venezuela
      'VN' => 246, # Vietnam
      'VG' => 247, # British Virgin Islands
      'VI' => 248, # United States Virgin Islands
      'WF' => 249, # Wallis and Futuna
      'EH' => 250, # Western Sahara
      'ZM' => 252, # Zambia
      'ZW' => 253, # Zimbabwe
      'AE' => 254, # United Arab Emirates
      # 'DE' => 255, # Helgoland
      # 'DE' => 256, # Buesingen
      # 'CUW' => 258, # Curacao
      'SXM' => 259, # Sint Maarten
      'BES' => 260, # BES Islands
    }.freeze
  end
end
