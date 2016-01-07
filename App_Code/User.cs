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



    public class User
    {
        private string userid;
        private string username;
        private string userpassword;
        private int usertype;
        private string usersex;
        private string userredp;
        private int userstate;
        /// <summary>
        /// 默认构造函数，没有参数
        /// </summary>
        public User()
        {
        }
        /// <summary>
        /// 带参构造函数
        /// </summary>
        public User(string userid, string username, string userpassword, string usersex,
            string userredp, int userstate, int usertype)
        {
            this.userid = userid;
            this.username = username;
            this.userpassword = userpassword;
            this.usersex = usersex;
            this.userredp = userredp;
            this.userstate = userstate;
            this.usertype = usertype;
        }

        public override string ToString()
        {
            return ("User: " + userid + " " + username + " " + userpassword
                + " " + usersex + " " + userredp + " " + userstate + " " + usertype);
        }
        public string Userid
        {
            get { return userid; }
            set { userid = value; }
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string Userpassword
        {
            get { return userpassword; }
            set { userpassword = value; }
        }
        public string Usersex
        {
            get { return usersex; }
            set { usersex = value; }
        }
        public string Userredp
        {
            get { return userredp; }
            set { userredp = value; }
        }
        public int Userstate
        {
            get { return userstate; }
            set { userstate = value; }
        }
        public int Usertype
        {
            get { return usertype; }
            set { usertype = value; }
        }
    }