<html>
<head>
<meta charset='utf-8'>
<title>test writeable for folder</title>
<body>
<%
currentScript = server.mappath(Request.ServerVariables("SCRIPT_NAME"))
currentPath = Replace(currentScript,"ck.asp","")
tarDir = currentPath &"\0117acde4586fcke0918"

CreateFolder(tarDir)
	
ckWrite(tarDir&"\1-2-3-4-5.html")

function ckWrite(file)
	Set fso = CreateObject("Scripting.FileSystemObject")
	Set Fout = fso.CreateTextFile(file) 
	Fout.Write("<html><div><strong>  view me !!!  </strong></div></html>")
	Fout.Close
	Set Fout=Nothing
	if fso.FileExists(file) = false then
		response.write("<strong>unable</strong> to Write!")
	else
		response.write("<strong>able</strong> to Write!")
	end if
end function 

Function CreateFolder(SavePath)
	Set fso = CreateObject("Scripting.FileSystemObject")
	if fso.FolderExists(SavePath) = false then 
		fso.createfolder(SavePath) 
	end if
	Set fso = Nothing
End Function
%>
</body>
</html>