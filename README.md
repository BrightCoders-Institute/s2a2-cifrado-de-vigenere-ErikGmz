
![BrightCoders Logo](img/logo.png)

# Cifrado de Vigénere

## 📓 Descripción
Programa para generar un mensaje encriptado a partir de una cadena de texto y contraseña.

## 📋 Tabla de contenido
- Tecnologías.
- Cómo instalar y ejecutar el proyecto.
- Cómo ejecutar las pruebas del proyecto.
- Cómo ejecutar Rubocop en el proyecto.
- Créditos.
- Badges.

## 🔧 Tecnologías
- Ruby.
- Rubocop.
- Minitest.

## ⚙️ Cómo instalar y ejecutar el proyecto
>_**1.** Verificar que Ruby se encuentre instalado en el sistema._
>```
>$ ruby -v
>   ruby 3.2.2-1 (set by C:\Ruby-on-Windows\global.txt)
>```
>
>_**2.** Clonar o descargar el repositorio._
>```
>$ git clone https://github.com/BrightCoders-Institute/s2a2-cifrado-de-vigenere-ErikGmz.git
>```
>
>_**3.** Desplazarse al directorio del proyecto._
>```
>$ cd <ruta_directorio>
>```
>
>_**4.** Ejecutar el archivo "main.rb" desde una terminal de comandos, pasando como parámetros el mensaje y el código para el encriptado._
>```
>$ ruby .\src\main.rb Hola Secreto
>   Message: Hola.
>   Cipher Code: Secreto.
>   Encoded Message: ZSNR.
>
>$ ruby .\src\main.rb Ruby CoDC 
>   Message: Ruby.
>   Cipher Code: CoDC.
>   Encoded Message: TJEA.
>
>$ ruby .\src\main.rb 'Palabra secreta' 'Clave secreta'
>   Message: Palabra secreta.
>   Cipher Code: Clave secreta.
>   Encoded Message: RLLVFKE UVGLEVL.
>```

## 🔬 Cómo ejecutar las pruebas del proyecto
>_**1.** Instalar las gemas de Minitest y ffi._
>```
>$ gem install minitest
>   Successfully installed minitest-5.20.0
>   Parsing documentation for minitest-5.20.0
>   Couldn't find file to include 'README.rdoc' from lib/minitest.rb
>   Done installing documentation for minitest after 2 seconds
>   1 gem installed
>
> $ gem install ffi
>   Successfully installed ffi-1.16.3-x64-mingw-ucrt
>   Parsing documentation for ffi-1.16.3-x64-mingw-ucrt
>   Done installing documentation for ffi after 1 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar directamente desde el directorio del proyecto los archivos con las pruebas de interés._
>```
>$ ruby .\test\vigenere_cipher\test_vigenere_cipher.rb
>   Run options: --seed 26294
>
>   # Running:
>
>   ............
>
>   Finished in 0.047227s, 254.0941 runs/s, 825.8058 assertions/s.
>
>   12 runs, 39 assertions, 0 failures, 0 errors, 0 skips
>
>
>$ ruby .\test\vigenere_cipher\test_encode_string_to_numbers_method.rb
>   Run options: --seed 47885
>
>   # Running:
>
>   ............
>
>   Finished in 0.033684s, 356.2543 runs/s, 682.8208 assertions/s.
>
>   12 runs, 23 assertions, 0 failures, 0 errors, 0 skips
>```

## 🔍 Cómo ejecutar Rubocop en el proyecto
>_**1.** Instalar la gema de Rubocop._
>```
>$ gem install rubocop
>   rbenv: Rehash executable 'rubocop' for gem 'rubocop'
>   Successfully installed rubocop-1.59.0
>   Parsing documentation for rubocop-1.59.0
>   Done installing documentation for rubocop after 14 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar Rubocop en el directorio del proyecto._
>```
>$ rubocop
>   Inspecting 23 files
>   .......................
>   
>   23 files inspected, no offenses detected
>
>$ rubocop -L
>   Gemfile
>   src/classes/character_to_integer_encoding.rb
>   src/classes/format_cipher_code.rb
>   src/classes/integer_to_character_decoding.rb
>   src/classes/vigenere_cipher.rb
>   src/inheritance_classes/arguments_data_validation.rb
>   src/inheritance_classes/encoding_control.rb
>   src/main.rb
>   test/character_to_integer_encoding/test_character_to_integer_encoding.rb
>   test/character_to_integer_encoding/test_character_to_integer_encoding_setter.rb
>   test/character_to_integer_encoding/test_leave_original_if_not_alphabetic_method.rb
>   test/format_cipher_code/test_check_arguments_validity_method.rb
>   test/format_cipher_code/test_check_cipher_code_validity_method.rb
>   test/format_cipher_code/test_format_cipher_code.rb
>   test/format_cipher_code/test_format_cipher_code_setter.rb
>   test/inheritance_test_classes/test_argument_types.rb
>   test/integer_to_character_decoding/test_integer_to_character_decoding.rb
>   test/integer_to_character_decoding/test_integer_to_character_decoding_setter.rb
>   test/integer_to_character_decoding/test_leave_original_if_not_alphabetic_method.rb
>   test/vigenere_cipher/test_cipher_original_message_method.rb
>   test/vigenere_cipher/test_decode_numbers_array_method.rb
>   test/vigenere_cipher/test_encode_string_to_numbers_method.rb
>   test/vigenere_cipher/test_vigenere_cipher.rb
>```

## 🕹️ Créditos
- **[ErikGmz](https://github.com/ErikGmz)**

## 💻 Badges
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
