(function() {

var data = {action:[],_meta:{params:{},logConsole:false,errorsSent:0, muteScriptErrors: false, maxSendErrors:100}};
var fns = {
		ready: function(value) {
			this._meta.ready = value;
		}
		,logConsole: function(val) {
			this._meta.logConsole=val;
		}
		,sendPageView: function() {
			data.type="pageview";
			var url = genPixel(this);
			// send pixel;
			new Image().src=url;
		}
		,sendError: function(msg,url,line,col,err) {
			if (this._meta.errorsSent >= this._meta.maxSendErrors)
				return;
			if (this._meta.muteScriptErrors && msg && (msg.toLowerCase().substring(0,"script error".length) === "script error")) {
				return;
			}
			fns.sendErrorAll.apply(this,arguments);
		}
		,sendErrorAll: function(msg,url,line,col,err) {
			if (this._meta.errorsSent >= this._meta.maxSendErrors)
				return;
			var data2 = {};
			data2.id = this.id;
			if (typeof this.domain !== "undefined" && this.domain) {
				data2.domain = this.domain;
			}
			if (typeof this.path !== "undefined" && this.path) {
				data2.path = this.path;
			}
			if (typeof this.qs !== "undefined" && this.qs) {
				data2.qs = this.qs;
			}
			if (typeof this.userType !== "undefined" && this.userType) {
				data2.userType = this.userType;
			}
			if (typeof this.ab !== "undefined" && this.ab) {
				data2.ab = this.ab;
			}
			if (typeof this.os !== "undefined" && this.os) {
				data2.os = this.os;
			}
			if (typeof this.deviceVersion !== "undefined" && this.deviceVersion) {
				data2.deviceVersion = this.deviceVersion;
			}
			if (typeof this.userId !== "undefined" && this.userId) {
				data2.userId = this.userId;
			}
			if (typeof this.version !== "undefined" && this.version) {
				data2.version = this.version;
			}
			if (typeof this.server !== "undefined" && this.server) {
				data2.server = this.server;
			}
			data2.type = "error";
			if (typeof msg !== "undefined" && msg) {
				data2.msg=msg;
			}
			if (typeof url !== "undefined" && url) {
				data2.url=url;
			}	
			if (typeof line !== "undefined" && line) {
				data2.line=line;
			} 
			if (typeof col !== "undefined" && col) {
				data2.col=col;
			} 
			if (typeof err !== "undefined" && err) {
				data2.error=err;
			} 
			this._meta.errorsSent++;
			var url = genPixel(data2);
			// send pixel;
			new Image().src=url;
		}
		,newAction: function(actionName, actionValue) {
			// should we encode Names? what are the rules?
			if (typeof actionValue === "undefined") {
				this.action.push(actionName);
			} else {
				this.action.push(actionName+"="+encodeURIComponent(actionValue));
			}
		}
		,sendAction: function(actionName, actionValue) {
			if (typeof actionName !== "undefined") {
				// add in the new action
				fns.newAction.apply(this,arguments);
			}
			var data2 = {};
			data2.id = this.id;
			if (typeof this.domain !== "undefined" && this.domain) {
				data2.domain = this.domain;
			}
			if (typeof this.path !== "undefined" && this.path) {
				data2.path = this.path;
			}
			if (typeof this.qs !== "undefined" && this.qs) {
				data2.qs = this.qs;
			}
			if (typeof this.userType !== "undefined" && this.userType) {
				data2.userType = this.userType;
			}
			if (typeof this.ab !== "undefined" && this.ab) {
				data2.ab = this.ab;
			}
			if (typeof this.os !== "undefined" && this.os) {
				data2.os = this.os;
			}
			if (typeof this.deviceVersion !== "undefined" && this.deviceVersion) {
				data2.deviceVersion = this.deviceVersion;
			}
			if (typeof this.userId !== "undefined" && this.userId) {
				data2.userId = this.userId;
			}
			if (typeof this.version !== "undefined" && this.version) {
				data2.version = this.version;
			}
			if (typeof this.server !== "undefined" && this.server) {
				data2.server = this.server;
			}
			data2.action = data.action;
			data2.type = "action";
			var url = genPixel(data2);
			// send pixel;
			new Image().src=url;
			data.action.length=0; // also sets data2!
		}
		,setId: function(value) {
				this.id = value;
		}
		,setMuteScriptErrors: function(value) {
			this._meta.muteScriptErrors = value;
		}
		,setMaxSendErrors: function(value) {
			this._meta.maxSendErrors = value;
		}
		,setUserType: function(value) {
				this.userType = value;
		}
		,setDomain: function(value) {
				this.domain = value;
		}
		,setPath: function(value) {
				this.path = value;
		}
		,setAbTest: function(value) {
				this.ab = value;
		}
		,setLocParam: function(value) {
			value = this._meta.params[value];
			if (typeof value !== "undefined")
				this.loc = value[0];
		}
		,setOs: function(value) {
				this.os = value;
		}
		,setDeviceVersion: function(value) {
				this.deviceVersion = value;
		}
		,setUserId: function(value) {
				this.userId = value;
		}
		,setVersion: function(value) {
				this.version = value;
		}
		,setServer: function(value) {
				this.server = value;
		}
		,setActionParam: function(action) {
			value = this._meta.params[action];
			if (typeof value !== "undefined") {
				this.action = value; // array
			}
		}

		,setUserVar: function(name,value) {}
		,setSessionVar: function() {}
		,setPageVar: function() {}
};

function genPixel(props) {
	var url="https://www.stat-bot.com/pixel.gif?v=1.0";
	for (v in props) {
		if (v === "_meta")
			continue;
		if (v === "action") {// array
			var arrayList = props[v];
			if (arrayList.length == 0)
				continue;
			url += "&action=";
			var actionV = "";
			for (var i=0;i<arrayList.length;i++) {
				if (i > 0)
					actionV += ","; // encodeURIComponent(",")
				actionV += arrayList[i];
			}
			url += encodeURIComponent(actionV);
		} else {
			url += "&"+v+"="+encodeURIComponent(props[v]);
		}
	}
	url += "&_="+Math.random();
	return url;
}

function processPage(data) {
	if (typeof data.domain === "undefined")
		data.domain = document.location.hostname;
	if (typeof data.path === "undefined")
		data.path = document.location.pathname;
	if (document.location.search && typeof data.qs === "undefined" ) {
		data.qs = document.location.search.substring(1,1024);
		var ppp = data._meta.params;
		var re = /([^=&]+)=([^&]*)/g;
		var param;
		while (param = re.exec(data.qs)) {
			name = decodeURIComponent(param[1]);
			ppp[name]= ppp[name] || [];
			ppp[name].push(decodeURIComponent(param[2]));
		}
	}
	//http://www.html5rocks.com/en/tutorials/webperformance/basics/
	if (typeof window.performance !== "undefined") {
		var t = window.performance.timing;
		var dns = t.domainLookupEnd - t.domainLookupStart;
		var pageLoad = t.loadEventEnd-t.navigationStart; // load the whole page
		var pageTime = t.responseEnd - t.fetchStart; // just the page
		var ttfb = t.responseStart - t.requestStart; // ttfb for page
		data.dns = dns;
		data.pageLoad = pageLoad;
		data.pageTime = pageTime;
		data.ttfb = ttfb;
	}
}

function processFunctions(data,q) {
	if (q) {
	    for (var i=0;i<q.length;i++) {
		var args = Array.prototype.slice.call(q[i]);
		var f = fns[args[0]];
		if (typeof f === "function") {
			if (data._meta.logConsole) {
				console.log("call:"+args.join(" "));
			}
			args.shift();
			f.apply(data,args);
		} else {
			//window.alert("statbot: missing function:"+args[0]);
		}
	    }
	    q.length = 0;
	}
}

function addPush(q) {
	q.push = function (){
		//console.log("push it");
	    /*var ret=*/ Array.prototype.push.apply(this,arguments);
	    //return ret;
	    processFunctions(data,q);
	}
}

function goReady() {
		processPage(data);
		processFunctions(data,window[window['StatBotObject']].q);
		if (typeof data._meta.ready === "function") {
			data._meta.ready();
		}
		addPush(window[window['StatBotObject']].q);
}
var rrr = function(){
	if (/in/.test(document.readyState)) {
		//console.log("keep waiting");
		setTimeout(rrr,9);
	}
	else {
		goReady();
	}
}
rrr();
//if (document.addEventListener)
	//document.addEventListener("DOMContentLoaded",goReady);
//else if (document.attachEvent){
	//document.attachEvent("onreadystatechange", function(){
		//if ( document.readyState === "complete" ) {
			//goReady();
		//}
	//});
//} else {
	//goReady();
//}

}());
