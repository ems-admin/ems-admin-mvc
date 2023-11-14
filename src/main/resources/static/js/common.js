function successMsg(msg){
    layer.alert(msg, {icon: 1})
}

function errorMsg(msg){
    layer.alert(msg, {icon: 2})
}

function waringMsg(msg){
    layer.alert(msg, {icon: 3})
}

function infoMsg(msg){
    layer.alert(msg, {icon: 0})
}

function hasPer(per){
    const permission = sessionStorage.getItem('btn').split(',')
    return permission.indexOf(per) > -1
}