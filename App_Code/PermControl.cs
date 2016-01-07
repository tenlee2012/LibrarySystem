using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class PermControl
{
    public PermControl()
    { 
    }

    static public string CheckUserType(object usertype, int type)
    {
        if (usertype == null)
        {
            return ("<script>alert('你还没有登录,返回登录');location='/login.aspx'</script>");
        }
        else if (Convert.ToInt32(usertype) > type)
        {
            return ("<script>alert('你没有权限访问');location='/'</script>");
        }
        return "";
    }
}
