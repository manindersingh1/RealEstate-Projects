using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
namespace Property
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Upload_Files(object sender, EventArgs e)
        {
            if (fileUpload.HasFile)     // CHECK IF ANY FILE HAS BEEN SELECTED.
            {
                int iUploadedCnt = 0;
                int iFailedCnt = 0;
                HttpFileCollection hfc = Request.Files;
                lblFileList.Text = "Select <b>" + hfc.Count + "</b> file(s)";

                if (hfc.Count <= 10)    // 10 FILES RESTRICTION.
                {
                    for (int i = 0; i <= hfc.Count - 1; i++)
                    {
                        HttpPostedFile hpf = hfc[i];
                        if (hpf.ContentLength > 0)
                        {
                            if (!File.Exists(Server.MapPath("images\\") +
                                Path.GetFileName(hpf.FileName)))
                            {
                                DirectoryInfo objDir =
                                    new DirectoryInfo(Server.MapPath("images\\"));

                                string sFileName = Path.GetFileName(hpf.FileName);
                                string sFileExt = Path.GetExtension(hpf.FileName);

                                // CHECK FOR DUPLICATE FILES.
                                FileInfo[] objFI =
                                    objDir.GetFiles(sFileName.Replace(sFileExt, "") + ".*");

                                if (objFI.Length > 0)
                                {
                                    // CHECK IF FILE WITH THE SAME NAME EXISTS 
                                   //(IGNORING THE EXTENTIONS).
                                    foreach (FileInfo file in objFI)
                                    {
                                        string sFileName1 = objFI[0].Name;
                                        string sFileExt1 = Path.GetExtension(objFI[0].Name);

                                        if (sFileName1.Replace(sFileExt1, "") ==
                                                sFileName.Replace(sFileExt, ""))
                                        {
                                            iFailedCnt += 1;        // NOT ALLOWING DUPLICATE.
                                            break;
                                        }
                                    }
                                }
                                else
                                {
                                    // SAVE THE FILE IN A FOLDER.
                                    hpf.SaveAs(Server.MapPath("CopyFiles\\") +
                                        Path.GetFileName(hpf.FileName));
                                    iUploadedCnt += 1;
                                }
                            }
                        }
                    }
                    lblUploadStatus.Text = "<b>" + iUploadedCnt + "</b> file(s) Uploaded.";
                    lblFailedStatus.Text = "<b>" + iFailedCnt +
                        "</b> duplicate file(s) could not be uploaded.";
                }
                else lblUploadStatus.Text = "Max. 10 files allowed.";
            }
            else lblUploadStatus.Text = "No files selected.";
        }
    }
}