using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
//using WebApplication4;

namespace WebApplication4
{
    public partial class SQLTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           Configuration rootWebConfig1 =
                System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration(null);
           KeyValueConfigurationElement customSetting =
                   rootWebConfig1.AppSettings.Settings["bor_length"];
            //if(customSetting != null)
                //this.Label2.Text = customSetting.ToString();
           ConfigurationManager.AppSettings["bor_length"] = "40";
            this.Label2.Text = ConfigurationManager.AppSettings["bor_length"].ToString();
            string strsql = "select borstate,bordate,shouldreturndate from lib_borrow where borid=40";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            conn.Open();
            //cmd.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = "admin";
            //cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = dbutils.GetMD5("admin");

            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            dr.Read();
                Response.Write(dr.GetValue(0).ToString() + dr.GetValue(1).ToString() + dr.GetValue(2).ToString() + "<br/>");
            this.Label1.Text = DateTime.Now.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = this.TextBox1.Text;
            this.Label1.Text = MyUtils.GetMD5(str);
        }
        protected void DetailsView1_ItemInserted(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Insert")
            {
                Response.Redirect("default.aspx");
            }
        }
    }
}