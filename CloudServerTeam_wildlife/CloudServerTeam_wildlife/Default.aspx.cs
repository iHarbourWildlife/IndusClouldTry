using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudServerTeam_wildlife
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private int loginCount = 0;
        public string LinkedChart = "";

        SqlConnection Conn_Login = new SqlConnection("Data Source=bds27116147.my3w.com;Integrated Security=False;User ID=bds27116147;Password=Sgdpz1234;");

        protected void LoginBtn_Clicked(object sender, EventArgs e)
        {
            string userName = inputEmail3.Text;
            string passWord = inputPassword3.Text;

            //正确的密码，此处应有向服务器请求正确密码，用户名密码可以用SQL保存，需要进行代码移植，此处先使用一个本地的预设
            string DefUserName = "admin"; //将用户作为索引查询是否有存在对应密码若无则返回空指针
            string correctKey = "password";

            //SQL查询步骤 注意列名与SQL上的对应
            Conn_Login.Open();
            string SQL_CMD = "SELECT * FROM [bds27116147_db].[dbo].[LogInfo] WHERE user_Name = " + "'" + userName + "'";//文字类型的值必须使用西文单引号

            //创建SqlCommand对象
            SqlCommand command_L = new SqlCommand(SQL_CMD, Conn_Login);
            //创建DataAdapter对象
            SqlDataAdapter dataAdapter = new SqlDataAdapter(command_L);
            //创建DataSet对象
            DataSet dataSet = new DataSet();
            dataAdapter.Fill(dataSet, "BLOBTest");
            int c = dataSet.Tables["BLOBTest"].Rows.Count;
            if (c > 0) //字符串字符
            {
                DefUserName = dataSet.Tables["BLOBTest"].Rows[c - 1]["user_Name"].ToString();
                correctKey = dataSet.Tables["BLOBTest"].Rows[c - 1]["pass_Word"].ToString();
                LinkedChart = dataSet.Tables["BLOBTest"].Rows[c - 1]["linked_Chart"].ToString();
                //字符截断
                DefUserName = DefUserName.TrimEnd();
                correctKey = correctKey.TrimEnd();
                LinkedChart = LinkedChart.TrimEnd();
            }

            if (userName != DefUserName)  //此if模拟返回空的正确密码
            {
                correctKey = string.Empty;
            }
            if (string.IsNullOrEmpty(correctKey) | correctKey != passWord) //密码判定条件，无对应密码即长度为0，有密码不对
            {
                loginCount = loginCount + 1;
                if (loginCount == 10) //输入错误次数过多请重新启动软件
                {
                    RegisterStartupScript(" ", "<script>alert(' 输入错误次数过多请重新加载'); </script> ");
                    //MessageBox.Show("输入错误次数过多请重新启动软件");
                    Conn_Login.Close(); //关闭SQL链接
                    //this.Close();
                }
                RegisterStartupScript(" ", "<script>alert(' 用户名或密码错误'); </script> ");
                //MessageBox.Show("用户名或密码错误");
                Conn_Login.Close(); //关闭SQL链接
                inputPassword3.Text = "";
            }
            else if (userName == DefUserName && passWord == correctKey) //再次确认
            {
                //此处应将用户名对应的SQL表单作为参数传入
                //MainForm main_form = new MainForm(LinkedChart);
                //main_form.Show();
                Conn_Login.Close(); //关闭SQL链接
                                    //this.Hide();                
                Session["LinkChartText"] = LinkedChart;
                Session["userName"] = userName;
                Response.Redirect("MainPage.aspx");  //重定向改了IsPostBack的属性

                //Server.Transfer("Main_Interface.aspx");
            }
        }
    }
}