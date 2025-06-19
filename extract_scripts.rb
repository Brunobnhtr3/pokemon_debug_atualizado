require 'fileutils'
require 'zlib'  # para descompressão zlib/gzip

SCRIPT_FILE = "Data/Scripts.rxdata"
OUTPUT_DIR = "extracted_scripts"

def extract_scripts
  unless File.exist?(SCRIPT_FILE)
    puts "Arquivo #{SCRIPT_FILE} não encontrado."
    return
  end

  scripts = Marshal.load(File.binread(SCRIPT_FILE))

  # Mostra exemplo do primeiro script para inspeção
  puts "Exemplo do primeiro script:"
  p scripts[0]

  FileUtils.mkdir_p(OUTPUT_DIR)

  scripts.each_with_index do |script, index|
    if script.is_a?(Array) && script.size == 3
      id, name, code = script
    else
      name, code = script
      id = index
    end

    name = name.to_s

    # Descomprime o código (se estiver comprimido)
    if code.is_a?(String) && code.bytesize > 2 && code[0].ord == 0x78 # 0x78 é início comum em zlib
      begin
        code = Zlib::Inflate.inflate(code)
      rescue => e
        puts "Falha ao descomprimir script #{name} (índice #{index}): #{e}"
      end
    end

    safe_name = name.gsub(/[^0-9A-Za-z_\-]/, '_')
    filename = "#{index.to_s.rjust(3, '0')}_#{safe_name}.rb"
    filepath = File.join(OUTPUT_DIR, filename)

    File.write(filepath, code)
    puts "Salvo script: #{filepath}"
  end

  puts "Extração concluída! Total de scripts: #{scripts.size}"
end

extract_scripts
