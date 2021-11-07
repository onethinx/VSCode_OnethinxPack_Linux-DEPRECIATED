exports.execute = async (args) => {
    var ret = null;
    const vscode = args.require('vscode');
    switch (args.command)
    {
        case 'otx.preLaunch':
            ret = await otxPreLaunch(vscode); 
            break;
        case 'otx.clean':
            ret = await otxClean(vscode);
            break;
        case 'otx.build':
                ret = await otxBuild(vscode);
                break;
        case 'otx.run':
            ret = await otxRun(vscode);
            break;
    }
    return ret;
};

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

otxPreLaunch = async (vscode) => {
    var ret = await vscode.commands.executeCommand('cmake.build');
    if (ret == 0) 
    {
         vscode.commands.executeCommand('workbench.panel.output.focus', 'Adapter Output');
        return '';
    }
    //var ret2 = JSON.stringify(ret);
    vscode.commands.executeCommand('workbench.action.problems.focus');
    vscode.window.showErrorMessage("Your Onethinx code didn't built well...\n\nTry some more :-)", { modal: true });
    return null;
};

otxClean = async (vscode) => {
    var ret = await vscode.commands.executeCommand('cmake.cleanConfigure');
    return ret;
};

otxBuild = async (vscode) => {
    var ret = await vscode.commands.executeCommand('cmake.build');
    if (ret == 0) 
    {
        //vscode.commands.executeCommand('workbench.action.problems.focus');
        vscode.commands.executeCommand('workbench.panel.output.focus', 'Git');
        //vscode.commands.executeCommand('workbench.action.focusPanel', 'Problems');
        return '';
    }
    vscode.commands.executeCommand('workbench.action.problems.focus');
    vscode.window.showErrorMessage("Your Onethinx code didn't built well...\n\nTry some more :-)");
    return null;
};

otxRun = async (vscode) => {
    //var ret = await vscode.commands.executeCommand('workbench.action.debug.run');
    //var ret = await vscode.commands.executeCommand('workbench.action.debug.selectandstart');
    var ret = await vscode.commands.executeCommand('workbench.action.debug.start');
    //vscode.treeView.reveal('Run', {focus: true});
    //vscode.commands.executeCommand('workbench.action.output.focus');
    vscode.commands.executeCommand('workbench.debug.action.focusRepl');
    return ret;
};