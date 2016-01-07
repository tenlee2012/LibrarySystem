using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication4
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void login_submit_Click(object sender, EventArgs e)
        {
            string username = this.username.Text;
            string password = this.password.Text;
            User user = MyUtils.user_login(username, password);
            if (user != null)
            {
                Session["userid"] = user.Userid;
                Session["username"] = user.Username;
                Session["usersex"] = user.Usersex;
                Session["userredp"] = user.Userredp;
                Session["usertype"] = user.Usertype;
                if (user.Usertype == 0)
                {
                    Response.Redirect("admin/");
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('登录失败,请返回查找原因');location='login.aspx'</script>");
            }
            //System.Diagnostics.Debug.Write(username + "#" + password);
        }
    }
}