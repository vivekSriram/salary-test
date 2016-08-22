
require 'roo'
require 'pdfkit'

xlsx = Roo::Spreadsheet.open('salary.xlsx')

xlsx.default_sheet = xlsx.sheets.first


21.upto(48) do |line|
	print " #{xlsx.cell(line, 'A')}:     #{xlsx.cell(line, 'X')}"
	puts ""

end


puts xlsx.celltype(21,'A')


21.upto(48) do |line|
	fileHtml = File.new("./htmls/salary#{line}.html", "w+")
	 fileHtml.puts "<HTML><BODY>"
	 fileHtml.puts "<div style = 'width:400px; height:300px; border:1px solid #979696; border-radius:5px; background-color: #D4D3D3' > <center><table>"
	fileHtml.puts "<tr><td><h2>Name :</h2></td><td><h2>#{xlsx.cell(line, 'A')}</h2></td></tr>"

	 fileHtml.puts "<tr><td><h3>salary :</h3></td><td><h3>#{xlsx.cell(line, 'X')}</h3></td></tr>"

	 fileHtml.puts "</table></center></div>"
	 fileHtml.puts "</BODY></HTML>"
	 fileHtml.close()
	 name = xlsx.cell(line, 'A')
	 name = name.gsub(" ","")
	 html = File.read("./htmls/salary#{line}.html")
	 kit = PDFKit.new(html, :page_size => 'Letter')

	 kit.to_file("./pdfs/#{name}_salary.pdf")
end
