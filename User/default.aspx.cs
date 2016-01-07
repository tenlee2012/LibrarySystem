using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class userinfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.userid.Text = Session["userid"] == null ? "" : Session["userid"].ToString();
                this.username.Text = Session["username"] == null ? "" : Session["username"].ToString();
                this.usersex.Text = Session["usersex"] == null ? "" : Session["usersex"].ToString();
                this.userredp.Text = Session["userredp"] == null ? "" : Session["userredp"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string oldpassword = this.oldpass.Text;
            string newpassword = this.newpass.Text;
            string res = "";
            if(Session["userid"] != null)
            {
                res = MyUtils.user_update(Session["userid"].ToString(), oldpassword, newpassword);
            }
            this.info.Text = res;

        }
    }
}