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

public class MyUtils
{
     static User user = new User();
     public MyUtils(){}
     static public int borlength = Convert.ToInt32(ConfigurationManager.AppSettings["bor_length"].ToString());
    static public SqlConnection GetConnection()
    {
        string myStr = ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        SqlConnection myConn = new SqlConnection(myStr);
        return myConn;
    }
    /// <summary>
    /// 执行非查询类SQL语句，并返回受影响的行数
    /// </summary>
    /// <param name="myCmd">执行SQL语句命令的SqlCommand对象</param>
    static public int ExecNonQuery(SqlCommand myCmd)
    {
        int ret = 0;
        try
        {
            if (myCmd.Connection.State != ConnectionState.Open)
            {
                myCmd.Connection.Open(); //打开与数据库的连接
            }
            //使用SqlCommand对象的ExecuteNonQuery方法执行SQL语句，并返回受影响的行数
            ret = myCmd.ExecuteNonQuery();

        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message, ex);
            ret = 0;
        }
        finally
        {
            if (myCmd.Connection.State == ConnectionState.Open)
            {
                myCmd.Connection.Close(); //关闭与数据库的连接
            }
        }
        return ret;
    }
    /// <summary>
    /// 获得图书剩余数目
    /// </summary>
    /// <param name="bookid"></param>
    /// <returns>int</returns>
    static public int GetBookRes(string bookid)
    {
        string strsql = "select bookres from lib_book where bookid='" + bookid + "'";
        SqlConnection conn = GetConnection();
        SqlCommand cmd = new SqlCommand(strsql, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        dr.Read();
        int res = 0;
        if (dr.HasRows)
        {
            res = Convert.ToInt32(dr.GetValue(0).ToString());
        }
        conn.Close();
        return res;
    }
     /// <summary>
     /// 用户登录
     /// </summary>
     /// <param name="username">用户id</param>
     /// <param name="password">密码,本函数会进行MD5转换</param>
     /// <returns>User类</returns>
    static public User user_login(string userid, string password)
    {
        password = GetMD5(password);
        string strsql = "select * from [lib_user] where userid=@id and userpassword=@password";
        SqlConnection conn = GetConnection();
        SqlCommand cmd = new SqlCommand(strsql, conn);
        conn.Open();
        cmd.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = userid;
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = password;

        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        dr.Read();
        user = new User();
        if (dr.HasRows)
        {
            user.Userpassword = "888888";
            user.Userid = dr.GetValue(0).ToString();
            user.Username = dr.GetValue(1).ToString();
            user.Usersex = dr.GetValue(3).ToString();
            user.Userredp = dr.GetValue(4).ToString();
            user.Userstate = Convert.ToInt32(dr.GetValue(5));
            user.Usertype = Convert.ToInt32(dr.GetValue(6));
        }
        else
        {
            user = null;
        }
        conn.Close();
        return user;
    }
    /// <summary>
    /// 用户信息更新
    /// </summary>
    /// <param name="username"></param>
    /// <param name="oldpwassword"></param>
    /// <param name="newpassword"></param>
    /// <returns></returns>
    static public string user_update(string userid, string oldpwassword, string newpassword)
    {
        if (user_login(userid, oldpwassword) == null)
        {
            return "原密码错误";
        }
        string strsql = "update [lib_user] set userpassword=@password"+
            " where userid=@userid";
        newpassword = GetMD5(newpassword);
        SqlConnection conn = GetConnection();
        SqlCommand cmd = new SqlCommand(strsql, conn);
        conn.Open();
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = newpassword;
        cmd.Parameters.Add("@userid", SqlDbType.VarChar, 50).Value = userid;
        int res = ExecNonQuery(cmd);
        if (res == 0)
        {
            return "密码更改失败";
        }
        else
        {
            return "密码更改成功";
        }
    }
     /// <summary>
     /// 图书查询
     /// </summary>
     /// <param name="searchinfo">要查询的信息</param>
     /// <param name="searchType">查询的类型(比如按照书名)</param>
     /// <returns>DataSet</returns>
    static public DataSet searchBook(string searchinfo, int searchType)
    {
        SqlConnection conn = GetConnection();
        SqlDataAdapter da;
        DataSet ds;
        string sql = "select * from lib_book";
        if (searchinfo == "")
        {
            sql = "select * from lib_book";
        }
        else if (searchType == 0)
        {
            sql = "select * from lib_book where bookname like'%" + searchinfo + "%'";
        }
        else if (searchType == 1)
        {
            sql = "select * from lib_book where bookauthor like '%" + searchinfo + "%'";
        }
        else if (searchType == 2)
        {
            sql = "select * from lib_book where ISBN like '%" + searchinfo + "%'";
        }
        else if (searchType == 3)
        {
            sql = "select * from lib_book where bookpub like '%" + searchinfo + "%'";
        }
        try
        {
            da = new SqlDataAdapter(sql, conn);
            ds = new DataSet();
            da.Fill(ds, "lib_book");
        }
        catch (Exception ex)
        {
            ds = null;
        }
        finally
        {
            conn.Close();
        }

        return ds;
    }
     /// <summary>
     /// 把图书添加到书包
     /// </summary>
     /// <param name="userid">用户id</param>
     /// <param name="bookid">图书id</param>
     /// <returns>正确返回'登录成功',错误返回'已经在书包了'</returns>
    static public string AddBag(string userid, string bookid)
    {
        string strsql = "insert into [bookbag](userid, bookid) values(@userid, @bookid)";
        if (GetBookRes(bookid) == 0)
        {
            return "书被借完了";
        }
        SqlConnection conn = GetConnection();
        SqlCommand cmd = new SqlCommand(strsql, conn);
        cmd.Parameters.Add("@userid", SqlDbType.VarChar, 50).Value = userid;
        cmd.Parameters.Add("@bookid", SqlDbType.Int).Value = Convert.ToInt32(bookid);
        int res = ExecNonQuery(cmd);
        if (res != 1)
        {
            return "添加失败,可能你的书包已存在";
        }
        else
        {
            return "添加成功";
        }
    }
    /// <summary>
    /// 从书包删除
    /// </summary>
    /// <param name="userid"></param>
    /// <param name="bookid"></param>
    /// <returns>string</returns>
    static public string DeleteBag(string userid, string bookid)
    {
        string strsql = "delete from [bookbag] where userid=@userid and bookid=@bookid";
        SqlConnection conn = GetConnection();
        SqlCommand cmd = new SqlCommand(strsql, conn);
        cmd.Parameters.Add("@userid", SqlDbType.VarChar, 50).Value = userid;
        cmd.Parameters.Add("@bookid", SqlDbType.Int).Value = Convert.ToInt32(bookid);
        int res = ExecNonQuery(cmd);
        if (res == 0)
        {
            return "失败";
        }
        else
        {
            return "删除成功";
        }
    }
     /// <summary>
     /// 获得用户的书包
     /// </summary>
     /// <param name="userid">用户id</param>
     /// <returns>DataSet</returns>
    static public DataSet GetBookbag(string userid)
    {
        SqlConnection conn = GetConnection();
        SqlDataAdapter da;
        DataSet ds;
        string strsql = "select * from lib_book where (bookid in (select bookid from bookbag where userid='" +  userid + "'))";
        try
        {
            da = new SqlDataAdapter(strsql, conn);
            ds = new DataSet();
            da.Fill(ds, "lib_book");
        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message, ex);
            ds = null;
        }
        finally
        {
            conn.Close();
        }
        return ds;
    }
    /// <summary>
    /// 借阅图书
    /// </summary>
    /// <param name="userid">用户id</param>
    /// <param name="bookid">图书id</param>
    /// <returns>string</returns>
    static public string BorrowBook(string userid, string bookid)
    {
        if (GetBookRes(bookid) == 0)
        {
            return "书被借完了";
        }
        string strsql = "insert into lib_borrow(bookid,userid,bordate,borstate,shouldreturndate)  values (@bookid,@userid,@bordate,@borstate,@shouldreturndate);";
        SqlConnection conn = GetConnection();
        SqlCommand cmd = new SqlCommand(strsql, conn);
        cmd.Parameters.Add("@userid", SqlDbType.VarChar, 50).Value = userid;
        cmd.Parameters.Add("@bookid", SqlDbType.Int).Value = Convert.ToInt32(bookid);
        cmd.Parameters.Add("@bordate", SqlDbType.DateTime).Value = DateTime.Now.ToString();
        cmd.Parameters.Add("@shouldreturndate", SqlDbType.DateTime).Value = DateTime.Now.AddDays(borlength).ToString();
        cmd.Parameters.Add("@borstate", SqlDbType.Int).Value = 0;
        int res = ExecNonQuery(cmd);
        if (res == 0)
        {
            return "居然出错了";
        }
        else
        {
            return "借阅成功";
        }
    }
    /// <summary>
    /// 获取现在正在借阅的图书
    /// </summary>
    /// <param name="userid">用户id</param>
    /// <returns>DataSet</returns>
    static public DataSet GetNowBorrow(string userid)
    {
        SqlConnection conn = GetConnection();
        SqlDataAdapter da;
        DataSet ds;
        string strsql = "select shouldreturndate,borid,lib_borrow.bookid,lib_borrow.userid, lib_book.bookname,bordate from lib_borrow left join lib_book on lib_book.bookid=lib_borrow.bookid where lib_borrow.userid='" + userid + "' and(lib_borrow.borstate=0 or lib_borrow.borstate=2);";
        try
        {
            da = new SqlDataAdapter(strsql, conn);
            ds = new DataSet();
            da.Fill(ds, "lib_book");
        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message, ex);
            ds = null;
        }
        finally
        {
            conn.Close();
        }
        return ds;
    }
    /// <summary>
    /// 还书
    /// </summary>
    /// <param name="borid"></param>
    /// <returns></returns>
    static public string ReturnBook(string borid)
    {
        string strsql = "update lib_borrow set retdate=@date, borstate='1' where borid=@borid;";
        SqlConnection conn = GetConnection();
        SqlCommand cmd = new SqlCommand(strsql, conn);
        cmd.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Now.ToString();
        cmd.Parameters.Add("@borid", SqlDbType.Int).Value = borid;
        int res = ExecNonQuery(cmd);
        if (res == 0)
        {
            return "居然出错了";
        }
        else
        {
            return "还书成功";
        }
    }
    /// <summary>
    /// 续借,每人每书只能续借一次
    /// </summary>
    /// <param name="borid"></param>
    /// <returns>string</returns>
    static public string Renew(string borid)
    { //borstate=2代表续借，每人每书只能续借一次。
        string querysql = "select borstate,bordate,shouldreturndate from lib_borrow where borid=" + borid;
        SqlConnection conn = GetConnection();
        SqlCommand cmd = new SqlCommand(querysql, conn);
        conn.Open();
        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        dr.Read();
        string borstate = dr.GetValue(0).ToString() ;
        DateTime bordate = Convert.ToDateTime(dr.GetValue(1).ToString());
        DateTime shouldreturndate = Convert.ToDateTime(dr.GetValue(2).ToString());
        dr.Close();
        if ("2".Equals(borstate))
        {
            return "已经续借过一次，续借失败！";
        }

        string strsql = "update lib_borrow set shouldreturndate=@date, borstate='2' where borid=@borid;";
        cmd = new SqlCommand(strsql, conn);
        cmd.Parameters.Add("@date", SqlDbType.DateTime).Value = DateTime.Now.AddDays(borlength).ToString();
        cmd.Parameters.Add("@borid", SqlDbType.Int).Value = borid;
        int res = ExecNonQuery(cmd);
        if (res == 0)
        {
            return "居然出错了";
        }
        else
        {
            return "续借成功";
        }
    }
    /// <summary>
    /// 获得用户历史借阅
    /// </summary>
    /// <param name="userid"></param>
    /// <returns></returns>
    static public DataSet GetHistoryBorrow(string userid)
    {
        SqlConnection conn = GetConnection();
        SqlDataAdapter da;
        DataSet ds;
        string strsql = "select borid,lib_borrow.bookid,lib_borrow.userid, lib_book.bookname,bordate,retdate from lib_borrow left join lib_book on lib_book.bookid=lib_borrow.bookid where lib_borrow.userid='" + userid + "' and lib_borrow.borstate=1;";
        try
        {
            da = new SqlDataAdapter(strsql, conn);
            ds = new DataSet();
            da.Fill(ds, "lib_book");
        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message, ex);
            ds = null;
        }
        finally
        {
            conn.Close();
        }
        return ds;
    }
    /// <summary>
    /// 用户借阅排名
    /// </summary>
    /// <param name="top"></param>
    /// <returns>DataSet</returns>
    static public DataSet UserBoard(int top)
    {
        string strsql = "select top " + top + " * from(select userid, user_sum=COUNT(lib_borrow.userid) from lib_borrow group by lib_borrow.userid) as A left join (select userid1=userid,username,usersex,userredp from lib_user) as B  on A.userid = B.userid1 order by A.user_sum desc;";
        SqlConnection conn = GetConnection();
        SqlDataAdapter da;
        DataSet ds;
        try
        {
            da = new SqlDataAdapter(strsql, conn);
            ds = new DataSet();
            da.Fill(ds, "lib_userboard");
        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message, ex);
            ds = null;
        }
        finally
        {
            conn.Close();
        }
        return ds;
    }
    /// <summary>
    /// 图书借阅排名
    /// </summary>
    /// <param name="top"></param>
    /// <returns>DataSet</returns>
    static public DataSet BookBoard(int top)
    {
        string strsql = "select top " + top + " * from(select top 10 bookid, bor_sum=COUNT(lib_borrow.bookid)  from lib_borrow group by lib_borrow.bookid) as A left join (select bookid1=bookid,bookname,bookauthor from lib_book) as B  on A.bookid = B.bookid1 order by A.bor_sum desc";
        SqlConnection conn = GetConnection();
        SqlDataAdapter da;
        DataSet ds;
        try
        {
            da = new SqlDataAdapter(strsql, conn);
            ds = new DataSet();
            da.Fill(ds, "lib_bookboard");
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
            ds = null;
        }
        finally
        {
            conn.Close();
        }
        return ds;
    }
    static public DataSet AllUserNowBorrow()
    {
        SqlConnection conn = GetConnection();
        SqlDataAdapter da;
        DataSet ds;
        string strsql = "select shouldreturndate,borid,lib_borrow.bookid,"+
            "lib_borrow.userid, lib_book.bookname,bordate from lib_borrow "+
            "left join lib_book on lib_book.bookid=lib_borrow.bookid "+
            "where(lib_borrow.borstate=0 or lib_borrow.borstate=2);";
        try
        {
            da = new SqlDataAdapter(strsql, conn);
            ds = new DataSet();
            da.Fill(ds, "lib_book");
        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message, ex);
            ds = null;
        }
        finally
        {
            conn.Close();
        }
        return ds;
    }
    static public DataSet AllUserHisBorrow()
    {
        SqlConnection conn = GetConnection();
        SqlDataAdapter da;
        DataSet ds;
        string strsql = "select retdate,borid,lib_borrow.bookid," +
            "lib_borrow.userid, lib_book.bookname,bordate from lib_borrow " +
            "left join lib_book on lib_book.bookid=lib_borrow.bookid " +
            "where(lib_borrow.borstate=1);";
        try
        {
            da = new SqlDataAdapter(strsql, conn);
            ds = new DataSet();
            da.Fill(ds, "lib_book");
        }
        catch (Exception ex)
        {
            //throw new Exception(ex.Message, ex);
            ds = null;
        }
        finally
        {
            conn.Close();
        }
        return ds;
    }
    ///<summary>
    ///MD5加密
    ///<param name="strPwd">被加密的字符串</param>
    ///<returns>返回被加密后的字符串</returns>
    ///</summary>
    static public string GetMD5(string strPwd)
    {
        MD5 md5 = new MD5CryptoServiceProvider();
        strPwd = strPwd + "tenlee";
        byte[] data = System.Text.Encoding.Default.GetBytes(strPwd);
        byte[] md5data = md5.ComputeHash(data);
        md5.Clear();
        string str = "";
        for (int i = 0; i < md5data.Length - 1; i++)
        {
            str += md5data[i].ToString("x").PadLeft(2, '0');
        }
        return str;
    }
}