﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication4
{
    public partial class userboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridViewBind();
        }
        private void GridViewBind()
        {
            GridView1.DataSource = MyUtils.UserBoard(10);
            GridView1.DataBind();
        }
    }
}