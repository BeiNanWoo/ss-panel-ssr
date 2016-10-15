<nav aria-hidden="true" class="menu menu-right" id="ui_menu_profile" tabindex="-1">
	<div class="menu-scroll">
		<div class="menu-top">
			<div class="menu-top-img">
				<img alt="John Smith" src="../assets/md-interface/images/samples/landscape.jpg">
			</div>
			<div class="menu-top-info">
				<a class="menu-top-user" href="javascript:void(0)"><span class="avatar avatar-inline margin-right"><img alt="alt text for John Smith avatar" src="{$user->gravatar}"></span>{$user->user_name}</a>
			</div>
			<div class="menu-top-info-sub">
				<small>欢迎回来{$user->user_name}</small>
			</div>
		</div>
		<div class="menu-content">
			<ul class="nav">
				<li>
					<a class="waves-attach" href="#ui_menu_link_settings">
						连接设置
						<span class="menu-collapse-toggle collapsed waves-attach" data-target="#ui_menu_link_settings" data-toggle="collapse">
							<div class="menu-collapse-toggle-close">
								<i class="icon icon-lg">close</i>
							</div>
							<div class="menu-collapse-toggle-default">
								<i class="icon icon-lg">apps</i>
							</div>
						</span>
					</a>
					<ul class="menu-collapse collapse" id="ui_menu_link_settings">
						<li>
							<a class="waves-attach" data-backdrop="static" data-toggle="modal" href="#ui_dialog_ss-passwd">连接密码与加密设置</a>
						</li>
						<li>
							<a class="waves-attach" data-backdrop="static" data-toggle="modal" href="#ui_dialog_ssr">SSR协议与混淆设置</a>
						</li>
					</ul>
				</li>
				<li>
					<a class="waves-attach" href="ui_menu_profile_settings">
					账户设定
					<span class="menu-collapse-toggle collapsed waves-attach" data-target="#ui_menu_profile_settings" data-toggle="collapse">
						<div class="menu-collapse-toggle-close">
							<i class="icon icon-lg">close</i>
						</div>
						<div class="menu-collapse-toggle-default">
							<i class="icon icon-lg">apps</i>
						</div>
					</span>
					</a>
					<ul class="menu-collapse collapse" id="ui_menu_profile_settings">
						<li>
							<a class="waves-attach" data-backdrop="static" data-toggle="modal" href="#ui_dialog_passwd">登陆密码设置</a>
						</li>
						<li>
							<a class="waves-attach" data-backdrop="static" data-toggle="modal" href="#ui_dialog_trafficlog">连接/流量记录</a>
						</li>
						<li>
							<a class="waves-attach" data-backdrop="static" data-toggle="modal" href="#ui_dialog_inv">邀请码</a>
						</li>
						<li>
							<a class="waves-attach" data-backdrop="static" data-toggle="modal" href="#ui_dialog_kill-account">永久删除账户</a>
						</li>
					</ul>
				</li>
				<li>
					<a class="waves-attach" href="page-login.html">Logout</a>
				</li>
			</ul>
		</div>
	</div>
</nav>