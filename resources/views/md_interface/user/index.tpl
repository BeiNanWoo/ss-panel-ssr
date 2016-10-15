{include file='header.tpl'}
<body class="page-brand">
<header class="header header-transparent header-waterfall ui-header">
		<ul class="nav nav-list pull-left">
			<li>
				<a data-toggle="menu" href="#ui_menu">
					<span class="icon icon-lg">menu</span>
				</a>
			</li>
		</ul>
		<ul class="nav nav-list pull-right">
			<li class="dropdown margin-right">
				<a data-toggle="menu" href="#ui_menu_profile">
					<span class="padding-right">{$user->user_name}</span>
					<span class="avatar avatar-sm"><img alt="User Image" src="{$user->gravatar}"></span>
				</a>
			</li>
		</ul>
	</header>
{include file='nav.tpl'}
{include file='user/user_nav.tpl'}
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
						<h1 class="content-heading">UserInterface</h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
					<section class="content-inner margin-top-no">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<p>
										<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#ui_collapse_msg">
											<span class="collapsed-hide">Collapse</span>
											<span class="collapsed-show">Expand</span>
										</a>
									</p>
									<div class="collapsible-region collapse" id="ui_collapse_msg">
										{$user_index_msg}
									</div>
								</div>
							</div>
						</div>
						<h3 class="h5">个人连接信息</h3>
						<div class="card">
							<div class="card-main">
								<div class="card-inner margin-bottom-no margin-top-no">
									<div class="card-table">
										<div class="table-responsive">
											<table class="table">
												<tbody>
													<tr>
														<td>端口:</td>
														<td>{$user->port}</td>
													</tr>
													<tr>
														<td>密码:</td>
														<td>{$user->passwd}</td>
													</tr>
													<tr>
														<td>自定义加密方式:</td>
														<td>{$user->method}</td>
													</tr>
													<tr>
														<td>自定义SSR连接协议:</td>
														<td>{$user->protocol}</td>
													</tr>
													<tr>
														<td>自定义SSR混淆方式:</td>
														<td>{$user->obfs}</td>
													</tr>
													<tr>
														<td>上次使用:</td>
														<td>{$user->lastSsTime()}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="card-action">
									<div class="card-action-btn pull-left">
										<a class="btn waves-attach" href="javascript:void(0)">修改连接信息</a>
									</div>
								</div>
							</div>
						</div>
						<h3 class="h5">流量与签到</h3>
						<div class="card">
							<div class="card-main">
								<div class="card-inner margin-bottom-no margin-top-no">
									<div class="card-table">
										<div class="table-responsive">
											<table class="table">
												<tbody>
													<tr>
														<td>总流量</td>
														<td>{$user->enableTraffic()}</td>
													</tr>
													<tr>
														<td>已用流量:</td>
														<td>{$user->usedTraffic()}</td>
													</tr>
													<tr>
														<td>剩余流量:</td>
														<td>{$user->unusedTraffic()}</td>
													</tr>
													<tr>
														<td>上次签到时间:</td>
														<td>{$user->lastCheckInTime()}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>										
			                        <p> 每{$config['checkinTime']}小时可以签到一次。</p>
									<p id="checkin-msg"></p>
								</div>
								<div class="card-action">
									<div class="card-action-btn pull-left">
										{if $user->isAbleToCheckin() }
				                            <a id="checkin" class="btn waves-attach btn-flat">签到</a>
				                        {else}
				                            <a class="btn waves-attach disabled" href="">不能签到</a>
				                        {/if}
									</div>
								</div>
							</div>
						</div>
						<h3 class="h5">節點列表</h3>
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<p class="card-heading"></p>
									<p>
										Lorem ipsum dolor sit amet.<br>
										{$node_msg}<br>
										<p>
											<a class="btn btn-flat collapsed waves-attach" data-toggle="collapse" href="#ui_collapse_node">
												<span class="collapsed-hide">收起/Collapse</span>
												<span class="collapsed-show">展开/Expand</span>
											</a>
										</p>
									</p>
									<div class="collapsible-region collapse" id="ui_collapse_node">
									{foreach $nodes as $node}
										<div class="col-md-6 col-sm-6 margin-top">
											<div class="card">
												<div class="card-main">
													<div class="card-inner">
														<p class="card-heading">{$node->name}</p>
														<div class="card-table">
															<div class="table-responsive">
																<table class="table">
																	<tbody>
																		<tr>
																			<td>狀態</td>
																			<td>{$node->status}</td>
																		</tr>
																		<tr>
																			<td>在綫人數</td>
																			<td>{$node->getOnlineUserCount()}</td>
																		</tr>
																		<tr>
																			<td>流量比例</td>
																			<td>{$node->traffic_rate}</td>
																		</tr>
																		<tr>
																			<td>產生流量</td>
																			<td>{$node->getTrafficFromLogs()}</td>
																		</tr>
																		<tr>
																			<td>在綫時間</td>
																			<td>{$node->getNodeUptime()}</td>
																		</tr>
																		<tr>
																			<td>负载</td>
																			<td>{$node->getNodeLoad()}</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													<div class="card-action">
														<div class="card-action-btn pull-left">
															<a class="btn btn-flat waves-attach" data-backdrop="static" data-toggle="modal" href="#ui_dialog_node_{$node->id}">详细信息/More</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									{/foreach}
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
<footer class="ui-footer">
	<div class="container">
		<p>SS-Panel-SSR</p>
	</div>
</footer>
<div class="fbtn-container">
	<div class="fbtn-inner">
		<a class="fbtn fbtn-lg fbtn-brand-accent waves-attach waves-circle waves-light" data-toggle="dropdown"><span class="fbtn-text fbtn-text-left">Links</span><span class="fbtn-ori icon">apps</span><span class="fbtn-sub icon">close</span></a>
		<div class="fbtn-dropup">
			<a class="fbtn waves-attach waves-circle" href="https://github.com/Daemonite/material" target="_blank"><span class="fbtn-text fbtn-text-left">Fork me on GitHub</span><span class="icon">code</span></a>
			<a class="fbtn fbtn-brand waves-attach waves-circle waves-light" href="https://twitter.com/daemonites" target="_blank"><span class="fbtn-text fbtn-text-left">Follow Daemon on Twitter</span><span class="icon">share</span></a>
			<a class="fbtn fbtn-green waves-attach waves-circle" href="http://www.daemon.com.au/" target="_blank"><span class="fbtn-text fbtn-text-left">Visit Daemon Website</span><span class="icon">link</span></a>
		</div>
	</div>
</div>
<!-- ===node_info==== -->
{foreach $nodes as $node}
	<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_node_{$node->id}" role="dialog" tabindex="-3">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-heading">
					<p class="modal-title">{$node->name}</p>
				</div>
				<div class="modal-inner">
					<p class="h5 margin-top-sm text-black-hint">{$node->info}</p>
					<div class="card-table">
						<div class="table-responsive">
							<table class="table">
								<tbody>
									<tr>
										<td>地址</td>
										<td>{$node->server}</td>
									</tr>
									<tr>
										<td>端口</td>
										<td>{$node->port}</td>
									</tr>
									<tr>
										<td>加密</td>
										<td>{if $node->custom_method == 1} {$user->method} {else} {$node->method} {/if}</td>
									</tr>
									<tr>
										<td>SSR协议</td>
										<td>{$user->protocol}</td>
									</tr>
									<tr>
										<td>SSR混淆</td>
										<td>{$user->obfs}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach disable">二维码</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">关闭</a></p>
				</div>
			</div>
		</div>
	</div>
{/foreach}

<!-- passwd_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_passwd" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">网站登陆密码修改</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">网站登陆密码修改</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Cancel</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Discard</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ss-passwd_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_ss-passwd" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">Shadowsocks连接密码修改</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">Shadowsocks连接密码修改</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Cancel</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Discard</a></p>
			</div>
		</div>
	</div>
</div>
<!-- ssr-protocol-obfs_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_ssr" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">SSR连接信息修改</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">SSR连接信息修改</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Cancel</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Discard</a></p>
			</div>
		</div>
	</div>
</div>
<!-- trafficlog_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_trafficlog" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">流量记录</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">流量记录</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Cancel</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Discard</a></p>
			</div>
		</div>
	</div>
</div>
<!-- kill-account_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_kill-account" role="dialog" tabindex="-3">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">彻底删除账户</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">彻底删除账户</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Cancel</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Discard</a></p>
			</div>
		</div>
	</div>
</div>
<!-- Invitation_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_inv" role="dialog" tabindex="-2">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">邀请码</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">邀请码</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Cancel</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Discard</a></p>
			</div>
		</div>
	</div>
</div>
<!-- qrcode_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="ui_dialog_qrcode" role="dialog" tabindex="-2">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-heading">
				<p class="modal-title">二维码</p>
			</div>
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint">二维码</p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Cancel</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">Discard</a></p>
			</div>
		</div>
	</div>
</div>




<!-- msg_modal -->
<div aria-hidden="true" class="modal modal-va-middle fade" id="msg-success" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<h4>成功/Success</h4>
				<p class="h5 margin-top-sm text-black-hint" id="msg-success-p"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="ok-close">关闭/Discard</a></p>
			</div>
		</div>
	</div>
</div>
<div aria-hidden="true" class="modal modal-va-middle fade" id="msg-error" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<h4>失败/Error</h4>
				<p class="h5 margin-top-sm text-black-hint" id="msg-error-p"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="error-close">关闭/Discard</a></p>
			</div>
		</div>
	</div>
</div>

<div style="display:none;">
    {$analyticsCode}
</div>
<!-- js -->
<script src="https://cdn.bootcss.com/jquery/2.2.0/jquery.min.js"></script>
<script src="../assets/md-interface/js/base.min.js"></script>
<script src="../assets/md-interface/js/project.min.js"></script>

<script>
    $(document).ready(function () {
        $("#checkin").click(function () {
            $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").modal('hide');
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "password",
                dataType: "json",
                data: {
                    oldpwd: $("#oldpwd").val(),
                    pwd: $("#pwd").val(),
                    repwd: $("#repwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#msg-error").modal('hide');
                        $("#msg-success").modal('show');
                        $("#msg-success-p").html(data.msg);
                    } else {
                        $("#msg-error").modal('show');
                        $("#msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#ss-pwd-update").click(function () {
            $.ajax({
                type: "POST",
                url: "sspwd",
                dataType: "json",
                data: {
                    sspwd: $("#sspwd").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").modal('show');
                        $("#ss-msg-success-p").html(data.msg);
                    } else {
                        $("#ss-msg-error").modal('show');
                        $("#ss-msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#method-update").click(function () {
            $.ajax({
                type: "POST",
                url: "method",
                dataType: "json",
                data: {
                    method: $("#method").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").modal('show');
                        $("#ss-msg-success-p").html(data.msg);
                    } else {
                        $("#ss-msg-error").modal('show');
                        $("#ss-msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#SSRProtocol-update").click(function () {
            $.ajax({
                type: "POST",
                url: "SSRProtocol",
                dataType: "json",
                data: {
                    SSRProtocol: $("#SSRProtocol").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").modal('show');
                        $("#ss-msg-success-p").html(data.msg);
                    } else {
                        $("#ss-msg-error").modal('show');
                        $("#ss-msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>


<script>
    $(document).ready(function () {
        $("#SSRobfs-update").click(function () {
            $.ajax({
                type: "POST",
                url: "SSRobfs",
                dataType: "json",
                data: {
                    SSRobfs: $("#SSRobfs").val()
                },
                success: function (data) {
                    if (data.ret) {
                        $("#ss-msg-success").modal('show');
                        $("#ss-msg-success-p").html(data.msg);
                    } else {
                        $("#ss-msg-error").modal('show');
                        $("#ss-msg-error-p").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    alert("发生错误：" + jqXHR.status);
                }
            })
        })
    })
</script>










</body>
</html>

















