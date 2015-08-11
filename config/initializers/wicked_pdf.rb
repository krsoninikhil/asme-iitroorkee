WickedPdf.config = {
  #:wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
  #:layout => "pdf.html",
  #:exe_path => 'C:\wkhtmltopdf\bin\wkhtmltopdf.exe'
  if Rails.env == 'development'
		:exe_path => 'C:\wkhtmltopdf\bin\wkhtmltopdf.exe'
	else
		:exe_path => '/usr/local/bin/wkhtmltopdf'
	end
}
