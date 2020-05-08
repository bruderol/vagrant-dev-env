#Environment
HOME_DIR=/home/vagrant
DOWNLOAD_DIR=${HOME_DIR}/Download

function installWget() {
  echo "INSTALLING WGET" \
    && sudo dnf -q install -y wget \
    && echo "WGET DONE"
}

function installNano() {
  echo "INSTALLING NANO" \
    && sudo dnf -q install -y nano \
    && echo "NANO DONE"
}

function installGit() {
  echo "INSTALLING GIT" \
    && sudo dnf -q install -y git \
    && echo "GIT DONE"
}

function installAtom() {
  echo "INSTALLING ATOM" \
    && sudo rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey \
    && sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo' \
    && sudo dnf -q install -y atom \
    && echo "ATOM DONE"
}

function installOpenJdk() {
  echo "INSTALLING OPENJDK" \
    && sudo dnf -q install -y java-1.8.0-openjdk-devel \
    && sudo echo "export JAVA_HOME=/usr/lib/jvm/java-openjdk" >> ${HOME_DIR}/.profile \
    && echo "OPENJDK DONE"
}

function installMaven() {
  local mavenVersion=3.6.0

  echo "INSTALLING MAVEN" \
    && wget -q http://www-eu.apache.org/dist/maven/maven-3/${mavenVersion}/binaries/apache-maven-${mavenVersion}-bin.tar.gz -P ${DOWNLOAD_DIR} \
    && sudo mkdir /opt/maven \
    && sudo tar xzf ${DOWNLOAD_DIR}/apache-maven-${mavenVersion}-bin.tar.gz -C /opt/maven --strip-components=1 \
    && sudo chown -R vagrant:vagrant /opt/maven \
    && echo "MAVEN DONE"
}

function installGradle() {
  local gradleVersion=5.1.1

  echo "INSTALLING GRADLE" \
    && wget -q https://services.gradle.org/distributions/gradle-${gradleVersion}-bin.zip -P ${DOWNLOAD_DIR} \
    && unzip -q ${DOWNLOAD_DIR}/gradle-${gradleVersion}-bin.zip -d ${DOWNLOAD_DIR} \
    && sudo mv ${DOWNLOAD_DIR}/gradle-${gradleVersion} /opt/gradle \
    && sudo chown -R vagrant:vagrant /opt/gradle \
    && echo "GRADLE DONE"
}

function installFirefox() {
  echo "INSTALLING FIREFOX" \
    && sudo dnf -q install -y firefox \
    && echo "FIREFOX DONE"
}

function installOhMyZsh() {
  echo "INSTALLING OH MY ZSH" \
    && sudo dnf -q install -y zsh \
    && git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME_DIR}/.oh-my-zsh \
    && cp /vagrant/.zshrc ${HOME_DIR}/.zshrc \
    && sudo usermod -s /bin/zsh vagrant \
    && echo "ZSH DONE"
}

function installNvm() {
  local nvmVersion=0.34.0

  echo "INSTALLING NVM" \
    && wget -qO- https://raw.githubusercontent.com/creationix/nvm/v${nvmVersion}/install.sh | bash \
    && echo "NVM DONE"
}

function installIntelliJ() {
  local intellijVersion=2020.1

  echo "INSTALLING INTELLIJ" \
    && wget -q https://download.jetbrains.com/idea/ideaIU-${intellijVersion}.tar.gz -P ${DOWNLOAD_DIR} \
    && sudo mkdir /opt/intellij \
    && sudo tar xzf ${DOWNLOAD_DIR}/ideaIU-${intellijVersion}.tar.gz -C /opt/intellij --strip-components=1 \
    && sudo chown -R vagrant:vagrant /opt/intellij \
    && mkdir -p ${HOME_DIR}/.local/share/applications \
    && echo '[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA Ultimate Edition
Icon=/opt/intellij/bin/idea.svg
Exec="/opt/intellij/bin/idea.sh" %f
Comment=Capable and Ergonomic IDE for JVM
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea' > ${HOME_DIR}/.local/share/applications/jetbrains-idea.desktop \
    && echo "INTELLIJ DONE"
}

function installDocker() {
  echo "INSTALLING DOCKER" \
    && echo "ignore following errors about no match for arguments and no packages to remove!" \
    && sudo dnf remove docker \
      docker-client \
      docker-client-latest \
      docker-common \
      docker-latest \
      docker-latest-logrotate \
      docker-logrotate \
      docker-selinux \
      docker-engine-selinux \
      docker-engine || true \
    && sudo dnf -q install -y dnf-plugins-core \
    && sudo dnf config-manager \
      --add-repo \
      https://download.docker.com/linux/fedora/docker-ce.repo \
    && sudo dnf -q install -y docker \
    && sudo groupadd docker || true \
    && sudo usermod -aG docker vagrant \
    && sudo systemctl start docker \
    && sudo systemctl enable docker \
    && echo "DOCKER DONE"
}

function installDockerCompose() {
  local dockerComposeVersion=1.24.0

  echo "INSTALLING DOCKER-COMPOSE" \
    && sudo curl -s -L "https://github.com/docker/compose/releases/download/${dockerComposeVersion}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && echo "DOCKER-COMPOSE DONE"
}

function installGnome() {
  echo "INSTALLING GNOME (this may take a long time)" \
    && sudo dnf -q groupinstall -y gnome-desktop base-x \
    && sudo systemctl set-default graphical.target \
    && echo "GNOME DONE"
}

function setupLocale() {
  echo "SETTING UP LOCALE" \
    && sudo localectl set-x11-keymap ch \
    && sudo timedatectl set-timezone Europe/Zurich \
    && echo "LOCALE DONE"
}

function setupWorkspace() {
  echo "SETTING UP WORKSPACE" \
    && mkdir ${HOME_DIR}/workspace \
    && echo "WORKSPACE DONE"
}

function setupPython() {
  echo "SETTING UP PYTHON" \
    && sudo ln -s /usr/bin/python3 /usr/bin/python \
    && echo "PYTHON DONE"
}

function setupFavoriteApps() {
  ##does not work - would need to be hoked into startup script --- too complicated
  echo "SETTING UP FAVORITE APPS BAR" \
    && sudo dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'jetbrains-idea.desktop', 'org.gnome.Terminal.desktop']" \
    && echo "FAVORITE APPS BAR DONE"
}

function cleanup() {
  echo "CLEAN UP" \
    && sudo rm -rf ${DOWNLOAD_DIR}/* \
    && echo "CLEAN UP DONE"
}

installWget
installNano
installAtom
installGit
installOpenJdk
installMaven

# installGradle
# disable gradle, cause download page sometimes tooo slow, and we better use gradle wrapper anyways

installFirefox

# installOhMyZsh
# turned zsh off, becasue only causes troubles:
# 1. gradle says that JAVA_HOME is wrong
# 2. lot of output "command not found" when starting normal terminal

installNvm
installIntelliJ
installDocker
installDockerCompose
installGnome
setupLocale
setupWorkspace
setupPython

# setupFavoriteApps
# does not work yet - needs to be added to startup script instead

cleanup
