using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Security.Cryptography;

namespace WebApplication4.admin
{
    public partial class userinfo : System.Web.UI.Page
    {
        public int flag = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            string res = PermControl.CheckUserType(Session["usertype"], 0);
            if (res != "")
            {
                Response.Write(res);
            }
            if (!IsPostBack)
            {
                SetUserInfo();
            }
        }
        protected void SetUserInfo()
        {
            if (Request.QueryString["id"] == null) return;
            string userid = Request.QueryString["id"].ToString();
            string strsql = "select * from lib_user where userid=@userid";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = userid;
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                this.userid.Text = dr["userid"].ToString();
                this.username.Text = dr["username"].ToString();
                this.usersex.Text = dr["usersex"].ToString();
                this.userredp.Text = dr["userredp"].ToString();
                this.usertype.Text = dr["usertype"].ToString();  
            }
            dr.Close();
            conn.Close();
        }

        
        protected void Button1_Click(object sender, EventArgs e)
        {
            string userid = this.userid.Text;
            string userpassword = MyUtils.GetMD5(userid);
            string username = this.username.Text;
            string usersex = this.usersex.Text;
            string userredp = this.userredp.SelectedValue.ToString();
            int usertype = Convert.ToInt32(this.usertype.SelectedValue.ToString());
            string strsql = "";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = null;
            if (this.CheckBox1.Checked)
            {
                strsql = "update lib_user set username=@username," +
                "userpassword=@userpassword,usersex=@usersex,userredp=@userredp," +
                "userstate=1,usertype=@usertype where userid=@userid";
                cmd = new SqlCommand(strsql, conn);
                cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = userid;
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
                cmd.Parameters.Add("@userpassword", SqlDbType.VarChar).Value
                        = userpassword;
                cmd.Parameters.Add("@usersex", SqlDbType.VarChar).Value = usersex;
                cmd.Parameters.Add("@userredp", SqlDbType.VarChar).Value = userredp;
                cmd.Parameters.Add("@usertype", SqlDbType.Int).Value = usertype;
            }
            else
            {
                strsql = "update lib_user set username=@username," +
                "usersex=@usersex,userredp=@userredp," +
                "userstate=1,usertype=@usertype where userid=@userid";
                cmd = new SqlCommand(strsql, conn);
                cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = userid;
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
                cmd.Parameters.Add("@usersex", SqlDbType.VarChar).Value = usersex;
                cmd.Parameters.Add("@userredp", SqlDbType.VarChar).Value = userredp;
                cmd.Parameters.Add("@usertype", SqlDbType.Int).Value = usertype;
            }
            int res = MyUtils.ExecNonQuery(cmd);
            
            this.addinfo.Text = res == 1 ? "修改成功" : "修改失败";
            flag = 1;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string strsql = "delete from lib_user where userid=@userid";
            SqlConnection conn = MyUtils.GetConnection();
            SqlCommand cmd = new SqlCommand(strsql, conn);
            cmd.Parameters.Add("@userid", SqlDbType.VarChar).Value = this.userid.Text;
            int res = MyUtils.ExecNonQuery(cmd);
            if (res == 1)
            {
                Response.Redirect("usermanage.aspx");
            }
            else
            {
                this.addinfo.Text = "删除失败";
                flag = 1;
            }
        }
    }
}