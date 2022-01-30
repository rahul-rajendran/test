#!/bin/bash
echo "######################################################"
echo -e "########## \033[1;94mInitiating Console Customization\033[0m ##########"
echo "######################################################"
echo -e "# \033[1;91mTASK 1\033[0m: Create temporary directory"
mkdir /tmp/script_dir &> /dev/null
echo -e "\u2714 Created temporary directory: /tmp/script_dir"
cd /tmp/script_dir &> /dev/null
echo -e "# \033[1mTASK 1\033[0m: \033[1;92mCompleted\033[0m"
echo "###################"
echo -e "# \033[1;91mTASK 2\033[0m: Add a custom logo and product name"
wget https://raw.githubusercontent.com/rejeeb786/test/main/qds.png &> /dev/null
echo -e "\u2714 Downloaded sample logo"
oc create configmap console-custom-logo --from-file qds.png -n openshift-config &> /dev/null
echo -e "\u2714 Imported logo file into config map"
oc patch console.operator.openshift.io cluster --type='merge' --patch '{"spec":{"customization": { "customLogoFile": {"key":"qds.png","name": "console-custom-logo"},"customProductName":"Qatar Datamation Systems W.L.L."}}}' &> /dev/null
echo -e "\u2714 Patched the web console’s operator configuration"
echo -e "# \033[1mTASK 2\033[0m: \033[1;92mCompleted\033[0m"
echo "###################"
echo -e "# \033[1;91mTASK 3\033[0m: Create custom links in the web console"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/console-link-help-menu-1.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to the Latest OCP Release"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/console-link-help-menu-2.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to the Red Hat CVE Database"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/console-link-help-menu-3.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Contact Red Hat"
oc apply -f console-link-help-menu-1.yaml &> /dev/null
oc apply -f console-link-help-menu-2.yaml &> /dev/null
oc apply -f console-link-help-menu-3.yaml &> /dev/null
echo -e "\u2714 Added custom links within the Help Menu"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/application-menu-link-1.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Red Hat Subscription Management"
wget https://raw.githubusercontent.com/rejeeb786/openshift-web-console-customizations/master/competition/rejeeb786/assets/codes/application-menu-link-2.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add the link to Launch a Meeting"
oc apply -f application-menu-link-1.yaml &> /dev/null
oc apply -f application-menu-link-2.yaml &> /dev/null
echo -e "\u2714 Added custom links within the Application Menu"
echo -e "# \033[1mTASK 3\033[0m: \033[1;92mCompleted\033[0m"
echo "###################"
echo -e "# \033[1;91mTASK 4\033[0m: Customize login/IdP selection page"
wget https://raw.githubusercontent.com/rejeeb786/test/main/providers.html &> /dev/null
echo -e "\u2714 Downloaded sample IdP selection template file"
oc create secret generic providers-template --from-file=providers.html -n openshift-config &> /dev/null
echo -e "\u2714 Created providers-template secret"
oc patch oauths cluster --type='merge' --patch '{"spec":{"templates": { "providerSelection": {"name":"providers-template"}}}}' &> /dev/null
echo -e "\u2714 Patched the authentication configuration"
wget https://raw.githubusercontent.com/rejeeb786/test/main/login.html &> /dev/null
echo -e "\u2714 Downloaded sample login page template file"
oc create secret generic login-template --from-file=login.html -n openshift-config &> /dev/null
echo -e "\u2714 Created login-template secret"
oc patch oauths cluster --type='merge' --patch '{"spec":{"templates": { "login": {"name":"login-template"}}}}'
echo -e "\u2714 Patched authentication configuration"
echo -e "\u2714 Generated custom login/IdP selection page"
echo -e "# \033[1mTASK 4\033[0m: \033[1;92mCompleted\033[0m"
echo "###################"
echo -e "# \033[1;91mTASK 5\033[0m: Create custom notification banner"
wget https://raw.githubusercontent.com/rejeeb786/test/main/banner-bottom.yaml &> /dev/null
echo -e "\u2714 Downloaded YAML file definition to add custom notification banner at bottom"
oc apply -f banner-bottom.yaml &> /dev/null
echo -e "\u2714 Added custom notification banner"
echo -e "# \033[1mTASK 5\033[0m: \033[1;92mCompleted\033[0m"
echo "####################################################"
echo -e "########## \033[1;94mConsole Customization Complete\033[0m ##########"
echo "####################################################"
echo -e "Console URL - \033[1;94mhttps://$(oc get route console -n openshift-console -o 'custom-columns=NAME:spec.host' --no-headers)\033[0m"
