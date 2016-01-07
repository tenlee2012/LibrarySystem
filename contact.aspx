<%@ Page Title="" Language="C#" MasterPageFile="~/base1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication4.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>��������ϵ</title>
    <style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contact">
	    <div class="container">
		    <div class="main-head-section">
			    <h2>��������ϵ</h2>
			    <div class="contact-map">
                    <div style="width:100%;height:500px;border:#ccc solid 1px;" id="dituContent"></div>
                    <!-- 
			        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d424396.3176723366!2d150.92243255000002!3d-33.7969235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b129838f39a743f%3A0x3017d681632a850!2sSydney+NSW%2C+Australia!5e0!3m2!1sen!2sin!4v1431587453420" width="100%" height="151px" frameborder="0" style="border:0"></iframe>
                    -->			    
                </div>
		    </div>
		    <div class="contact_top">			 		
			    <div class="col-md-8 contact_left">
			 	    <h4>����</h4>
			 		<p>�������ʲô������߽����������������ϵ����</p>
					<form>
					    <div class="form_details">
					        <input type="text" class="text" value="����" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '����';}">
						    <input type="text" class="text" value="����" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '����';}">
						    <input type="text" class="text" value="����" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '����';}">
						    <textarea value="Message" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">����</textarea>
						    <div class="clearfix"> </div>
						    <div class="sub-button">
						        <input type="submit" value="����">
					        </div>
				        </div>
				    </form>
                </div>
			    <div class="col-md-4 company-right">
			    <div class="company_ad">
				    <h3>��ַ</h3>
			      	<address>
					    <p>email : <a href="mailto:tenlee2012@163.com">tenlee2012@163.com</a></p>
						<p>phone : 1.306.222.4545</p>
						<p>��´��������</p>
						<p>��ɳ���й�</p>									 	 	
					</address>
				</div>
			</div>	
			<div class="clearfix"> </div>
	        </div>
	    </div>
    </div>


<script type="text/javascript">
    //�����ͳ�ʼ����ͼ������
    function initMap() {
        createMap();//������ͼ
        setMapEvent();//���õ�ͼ�¼�
        addMapControl();//���ͼ��ӿؼ�
        addMarker();//���ͼ�����marker
    }

    //������ͼ������
    function createMap() {
        var map = new BMap.Map("dituContent");//�ڰٶȵ�ͼ�����д���һ����ͼ
        var point = new BMap.Point(112.950336, 28.185609);//����һ�����ĵ�����
        map.centerAndZoom(point, 17);//�趨��ͼ�����ĵ�����겢����ͼ��ʾ�ڵ�ͼ������
        window.map = map;//��map�����洢��ȫ��
    }

    //��ͼ�¼����ú�����
    function setMapEvent() {
        map.enableDragging();//���õ�ͼ��ק�¼���Ĭ������(�ɲ�д)
        map.enableScrollWheelZoom();//���õ�ͼ���ַŴ���С
        map.enableDoubleClickZoom();//�������˫���Ŵ�Ĭ������(�ɲ�д)
        map.enableKeyboard();//���ü����������Ҽ��ƶ���ͼ
    }

    //��ͼ�ؼ���Ӻ�����
    function addMapControl() {
        //���ͼ��������ſؼ�
        var ctrl_nav = new BMap.NavigationControl({ anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE });
        map.addControl(ctrl_nav);
        //���ͼ���������ͼ�ؼ�
        var ctrl_ove = new BMap.OverviewMapControl({ anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1 });
        map.addControl(ctrl_ove);
        //���ͼ����ӱ����߿ؼ�
        var ctrl_sca = new BMap.ScaleControl({ anchor: BMAP_ANCHOR_BOTTOM_LEFT });
        map.addControl(ctrl_sca);
    }

    //��ע������
    var markerArr = [{ title: "����", content: "�ҵı�ע", point: "112.950318|28.185657", isOpen: 0, icon: { w: 21, h: 21, l: 0, t: 0, x: 6, lb: 5 } }
    ];
    //����marker
    function addMarker() {
        for (var i = 0; i < markerArr.length; i++) {
            var json = markerArr[i];
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0, p1);
            var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point, { icon: iconImg });
            var iw = createInfoWindow(i);
            var label = new BMap.Label(json.title, { "offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20) });
            marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                borderColor: "#808080",
                color: "#333",
                cursor: "pointer"
            });

            (function () {
                var index = i;
                var _iw = createInfoWindow(i);
                var _marker = marker;
                _marker.addEventListener("click", function () {
                    this.openInfoWindow(_iw);
                });
                _iw.addEventListener("open", function () {
                    _marker.getLabel().hide();
                })
                _iw.addEventListener("close", function () {
                    _marker.getLabel().show();
                })
                label.addEventListener("click", function () {
                    _marker.openInfoWindow(_iw);
                })
                if (!!json.isOpen) {
                    label.hide();
                    _marker.openInfoWindow(_iw);
                }
            })()
        }
    }
    //����InfoWindow
    function createInfoWindow(i) {
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
        return iw;
    }
    //����һ��Icon
    function createIcon(json) {
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w, json.h), { imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1), offset: new BMap.Size(json.x, json.h) })
        return icon;
    }

    initMap();//�����ͳ�ʼ����ͼ
</script>
</asp:Content>
