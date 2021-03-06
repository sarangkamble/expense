<%
	String type = request.getParameter("type");
	if(type.equals("vtype")){
		int vtypeid = Integer.parseInt(request.getParameter("vtypeid"));
		voucher.Type vtype = new voucher.Type(vtypeid);
		vtype.delete();
		if(request.getParameter("source").equals("list")){
			response.sendRedirect("../pages/vouchertype_list.jsp");
			return;
		}
	}
	else if(type.equals("bookmark")){
		String link = request.getParameter("link");
		db.Db db = new db.Db();
		db.connect();
		String query = "SELECT ID FROM BOOKMARK WHERE LINK = '" + link + "' AND USERID = '" + session.getAttribute("sessionUsername").toString() + "'";
		
		java.sql.ResultSet rs = db.executeQuery(query);
		rs.next();
		
		user.Bookmark bm = new user.Bookmark(rs.getInt(1));
		bm.delete();
		%> OK <%
		if(request.getParameter("source").equals("userlist")){
			response.sendRedirect("../pages/bookmark_list.jsp?userid="+session.getAttribute("sessionUsername").toString());
			return;
		}
	}
	else if(type.equals("voucher")){
		int vid = Integer.parseInt(request.getParameter("vid"));
		voucher.Voucher voucher = new voucher.Voucher(vid);
		voucher.delete();
		if(request.getParameter("source").equals("userlist")){
			user.User suser = (user.User)session.getAttribute("sessionUser");
			response.sendRedirect("../pages/voucher_list.jsp?userid="+suser.getUserid());
			return;
		}
		else {
			response.sendRedirect("../pages/dashboard.jsp");
		}
	}
	else if(type.equals("policy")){
		int pid = Integer.parseInt(request.getParameter("pid"));
		policy.Policy policy = new policy.Policy(pid);
		policy.delete();
		if(request.getParameter("source").equals("list")){
			response.sendRedirect("../pages/policy_list.jsp");
			return;
		}
	}
	else if(type.equals("report")){
		int rid = Integer.parseInt(request.getParameter("id"));
		report.Report report = new report.Report(rid);
		report.delete();
		if(request.getParameter("source").equals("userlist")){
			response.sendRedirect("../pages/report_list.jsp");
			return;
		}
	}
	else if(type.equals("user")){
		String userid = request.getParameter("userid");
		user.User user = new user.User(userid);
		user.delete();
		if(request.getParameter("source").equals("list")){
			String rstring = "";
			if(request.getParameter("did") != null){
				rstring = "?deptid=" + request.getParameter("did");
			}
			response.sendRedirect("../pages/user_list.jsp" + rstring);
			return;
		}
	}
	else if(type.equals("dept")){
		String deptid = request.getParameter("deptid");
		user.Department dept = new user.Department(Integer.parseInt(deptid));
		dept.delete();
		if(request.getParameter("source").equals("list")){
			response.sendRedirect("../pages/dept_list.jsp");
			return;
		}
	}
	else if(type.equals("aconfig")) {
		int configid = Integer.parseInt(request.getParameter("configid"));
		voucher.AmountConfig aconfig = new voucher.AmountConfig(configid);
		aconfig.delete();
		if(request.getParameter("source").equals("list")){
			response.sendRedirect("../pages/amount_config.jsp");
			return;
		}
	}
	else if(type.equals("rconfig")) {
		int configid = Integer.parseInt(request.getParameter("configid"));
		user.RoleConfig rconfig = new user.RoleConfig(configid);
		rconfig.delete();
		if(request.getParameter("source").equals("list")){
			response.sendRedirect("../pages/role_config.jsp");
			return;
		}
	}
%>