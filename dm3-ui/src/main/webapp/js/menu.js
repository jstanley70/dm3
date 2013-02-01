
function toggleView(e){
 
	var header = dojo.query(e.currentTarget);
	if(dojo.hasClass(header[0],"clicked")){
		header.attr("class", "");
		var children = header.query("ul");
		children.style("display", "block");
	} else {
		header.attr("class", "clicked");
		var children = header.query("ul");
		children.style("display", "none");
	}
	dojo.stopEvent(this.event); 
}  

function getView(url, submit, updateValues)
{
	if(submit == null)
		submit = dojo.query(event.currentTarget);
	var main = submit.closest('#main');
	if(main.length > 0)
		getMainView(url, updateValues);
	else
		getDialogView(url,submit, updateValues);
}

function submitForm(target)
{
	if(target == null)
		target = dojo.query(event.currentTarget);
	var main = target.closest('#main');
	if(main.length > 0)
		submitMainForm(target);
	else
		submitDialogForm(target); 
	
	dojo.stopEvent(this.event); 
}
function getInputValues(form) {
	var savedValues = new Array();
	form = dojo.query(form);
	inputs = form.query("input");
	inputs.forEach(function(input, index, array){
		var input = dojo.query(input);
		var name = input.attr("name");
		var value = input.attr("value");
		savedValues[name[0]] = value[0];
		});
	savedValues["action"] = form.attr("action")[0];
	return savedValues;
}

function setInputValues(form, values){
	form = dojo.query(form);
	if(values != null){
    	for(name in values) {
    		form.query("input[name='" + name +"']").attr("value", values[name])
    	}
    }
	form.attr("action", values["action"]);
}
function submitMainForm(target)
{
	var form = target.closest('form');
	dojo.xhrPost({
	    // The URL of the request
	    form: form[0],
	    // Handle the result as Html/Text data
	    handleAs: "text",
	    // The success handler
	    load: function(result) {
	    	dojo.byId("main").innerHTML = result;    	
	        setPanelsTitle();
	    },
	    handle: function(result){
	    },
	    // The error handler
	    error: function(errorMessage) {
	    	doDialog(errorMessage, title);
	    }
	});	
	 dojo.stopEvent(this.event); 
}

function getMainView(mainViewUrl, savedValues)
{
	dojo.xhrGet({
	    // The URL of the request
	    url: mainViewUrl,
	    // Handle the result as html/text data
	    handleAs: "text",
	    // The success handler
	    load: function(result) {
	        dojo.byId("main").innerHTML = result;
	        if(savedValues != null){
	        	var main = dojo.query("#main");
	        	var form = main.query("form")[0];
	        	setInputValues(form, savedValues);
	        }
	        	
	        setPanelsTitle();
	    },
	    handle: function(result){
	    },
	    // The error handler
	    error: function(errorMessage) {
	        dojo.byId("main").innerHTML = errorMessage;
	    }
	});	
}

function doAction(actionUrl, objectId, processorName, processorId)
{
	actionParameterizedUrl = actionUrl + "?objectId=" + objectId + "&processorId=" + processorId;
	actionRestfulUrl = actionUrl + "/" + objectId + "/" + processorId;
	dojo.xhrGet({
	    // The URL of the request
	    url: actionRestfulUrl ,
	    // Handle the result as html/text data
	    handleAs: "text",
	    // The success handler
	    load: function(result) {
	    	resultsPaneId = processorName + processorId;
	    	dojo.query("#"+ resultsPaneId).orphan();
	    	dojo.create("div", {id: resultsPaneId}, "results");
	    	dojo.byId(resultsPaneId).innerHTML = result;
	    },
	    handle: function(result){
	    },
	    // The error handler
	    error: function(errorMessage) {
	    	resultsPaneId = processorName + processorId;
	    	dojo.query("#"+ resultsPaneId).orphan();
	    	dojo.create("div", {id: resultsPaneId}, "results");
	    	dojo.byId(resultsPaneId).innerHTML = errorMessage;
	    }
	});	
}

function openSubentityDialog(createUrl, title)
{
	var submit = dojo.query(event.currentTarget);
	var container = submit.closest('.container');
	var form = submit.closest('form');
	var	parentId = form.attr("id")[0];
	var createParentUrl = form.attr("action");

	dojo.xhrGet({
	    // The URL of the request
	    url: createUrl,
	    // Handle the result as JSON data
	    handleAs: "text",
	    // The success handler
	    load: function(result) {
	    	doDialog(result, title, parentId, createParentUrl)
	    },
	    handle: function(result){
	    },
	    // The error handler
	    error: function(errorMessage) {
	    	doDialog(errorMessage, title);
	    }
	});	
	 dojo.stopEvent(this.event); 
}


function submitDialogForm(target)
{
	var container = target.closest('.container');
	var form = target.closest('form');
	var targetId = form.attr("id")[0];
	var parentId = container.query("input[name='parentId']").attr("value")[0];
	var savedValues;
	savedValues = getInputValues(dojo.query("#" + parentId)[0]);
	dojo.xhrPost({
	    // The URL of the request
	    form: form[0],
	    // Handle the result as JSON data
	    handleAs: "text",
	    // The success handler
	    load: function(result) {
	    	var parent = container.closest("[dojoattachpoint='containerNode']");
	    	dojo.place(result, container[0], "replace");
	    	var parentForm = dojo.query("#"+ parentId);
	    	var url = parentForm.attr("action")[0];
	    	var targetContainer = parent.query(".container")[0];
	    	addInput(targetContainer, "hidden", parentId, "parentId");
	    	getView(url + "?form", parentForm.query("[type='submit']"), savedValues);
	    },
	    handle: function(result){
	    },
	    // The error handler
	    error: function(errorMessage) {
	    	doDialog(errorMessage, title);
	    }
	});	
	 dojo.stopEvent(this.event); 
}

function getDialogView(view_url, request_list, savedValues)
{
	if(request_list == null)
	  request_list = dojo.query(event.currentTarget);
	
	var container = request_list.closest('.container');
	var parentId = container.query("input[name='parentId']").attr("value")[0];
	dojo.xhrGet({
	    // The URL of the request
	    url: view_url,
	    // Handle the result as text/html data
	    handleAs: "text",
	    // The success handler
	    load: function(result) {
	    	var parent = container.closest("[dojoattachpoint='containerNode']");
	    	dojo.place(result, container[0], "replace");
	    	var targetContainer = parent.query(".container");	    	
	    	if(savedValues != null){
	    		setInputValues(targetContainer.query("form")[0], savedValues);
	    		addInput(targetContainer.query("form")[0], "hidden", parentId, "parentId");
	    	}else{
	    		addInput(targetContainer[0], "hidden", parentId, "parentId");
	    	}
	    },
	    handle: function(result){
	    },
	    // The error handler
	    error: function(errorMessage) {
	    	doDialog(errorMessage, title);
	    }
	});	
	 dojo.stopEvent(this.event); 
}



function doDialog(content, title, parentId, createParentUrl) {
	 var secondDlg = new dijit.Dialog({
	        title: title,
	        content: content
	 });
	 secondDlg.show();
	 if(parentId != null){
		 form = dojo.query(secondDlg.containerNode).query("form")[0];
		 addInput(form, "hidden", parentId, "parentId");
	 }
}

function addInput(form, type, value, name)
{
	 var element = document.createElement("input");
	 element.setAttribute("type", type);
	 element.setAttribute("value", value);
	 element.setAttribute("name", name);
	 form.appendChild(element);
}
 
function myinit(){
	dojo.require('dijit.TitlePane');
	dojo.require("dojo.NodeList-traverse");
	var nodes = dojo.query('ul > li');
	nodes.onclick(function(e){toggleView(e);});
	nodes.query("ul").style("display", "none");
	nodes.attr("class", "clicked");
	setPanelsTitle();
}

function setPanelsTitle() {
	var main = dojo.query('#main');
	var nodes = main.query('[panelId]');
	nodes.forEach(function(node, index, array){
		var node = dojo.query(node);
		var panelId = node.attr("panelId");
		var panelTitle = node.attr("panelTitle");
		var springElement = new Spring.ElementDecoration({
			elementId : panelId[0], 
			widgetType : 'dijit.TitlePane', 
			widgetAttrs : {title: panelTitle[0], 
			open: true}});
		Spring.addDecoration(springElement)});
}
 
dojo.addOnLoad( myinit );