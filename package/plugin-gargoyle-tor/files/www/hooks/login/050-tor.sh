#!/usr/bin/haserl

<script>
<%
	tor_enabled=$(uci get tor.global.enabled 2>/dev/null)
	tor_client_mode=$(uci get tor.client.client_mode 2>/dev/null)
	tor_is_active=$(ipset --test tor_active_ips "$REMOTE_ADDR" 2>&1 | grep -v NOT)

	echo "var torEnabled = \"$tor_enabled\";"
	echo "var torClientMode = \"$tor_client_mode\";"
	echo "var torIsActive = \"$tor_is_active\";"
%>
</script>
<div id="tor_fields" style="display:none" class="row">
	<div class="col-lg-6">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">Tor</h3>
			</div>

			<div class="panel-body">
				<div class="row">
					<span id="tor_status_label" class="col-xs-5"><%~ 050-tor.tIP %>:</span>
					<span id="tor_status" class="col-xs-7" style="font-weight:bold;"></span>
				</div>
				<div class="row">
					<span class="col-xs-12">
						<button id="set_tor_button" class="btn btn-default" onclick="updateTorStatus()"><%~ tEnab %></button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
