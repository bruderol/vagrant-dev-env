#Environment
HOME_DIR=/home/vagrant
DOWNLOAD_DIR=${HOME_DIR}/Download

function installAndUpdateKernel() {
  echo "UPDATE KERNEL" \
    && sudo dnf -q install -y dkms kernel-devel gcc bzip2 make curl \
    && sudo dnf -q update -y kernel-* \
    && echo "KERNEL DONE"
}

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

function installOhMyZsh() {
  echo "INSTALLING OH MY ZSH" \
    && sudo dnf -q install -y zsh \
    && sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && sudo usermod -s /bin/zsh vagrant \
    && mv ${HOME_DIR}/.zshrc-custom  ${HOME_DIR}/.zshrc \
    && echo "ZSH DONE"
}

function addToPathAndSource() {
    local zshEnvFile=${HOME_DIR}/.zshenv
    echo -e $1 >> ${zshEnvFile} && source ${zshEnvFile}
}

function installOpenJdk() {
  echo "INSTALLING OPENJDK" \
    && sudo dnf -q install -y java-1.8.0-openjdk-devel \
    && addToPathAndSource 'export JAVA_HOME=/usr/lib/jvm/java-openjdk' \
    && echo "OPENJDK DONE"
}

function installMaven() {
  local mavenVersion=3.6.3

  echo "INSTALLING MAVEN" \
    && wget -q http://www-eu.apache.org/dist/maven/maven-3/${mavenVersion}/binaries/apache-maven-${mavenVersion}-bin.tar.gz -P ${DOWNLOAD_DIR} \
    && sudo mkdir /opt/maven \
    && sudo tar xzf ${DOWNLOAD_DIR}/apache-maven-${mavenVersion}-bin.tar.gz -C /opt/maven --strip-components=1 \
    && sudo chown -R vagrant:vagrant /opt/maven \
    && addToPathAndSource 'export PATH=$PATH:/opt/maven/bin' \
    && echo "MAVEN DONE"
}

function installGradle() {
  local gradleVersion=6.6.1

  echo "INSTALLING GRADLE" \
    && wget -q https://services.gradle.org/distributions/gradle-${gradleVersion}-bin.zip -P ${DOWNLOAD_DIR} \
    && unzip -q ${DOWNLOAD_DIR}/gradle-${gradleVersion}-bin.zip -d ${DOWNLOAD_DIR} \
    && sudo mv ${DOWNLOAD_DIR}/gradle-${gradleVersion} /opt/gradle \
    && sudo chown -R vagrant:vagrant /opt/gradle \
    && addToPathAndSource 'export PATH=$PATH:/opt/gradle/bin' \
    && echo "GRADLE DONE"
}

function installFirefox() {
  echo "INSTALLING FIREFOX" \
    && sudo dnf -q install -y firefox \
    && echo "FIREFOX DONE"
}

function installNvm() {
  local nvmVersion=0.35.3
  local defaultNodeVersion=14.10.1

  echo "INSTALLING NVM" \
    && wget -qO- https://raw.githubusercontent.com/creationix/nvm/v${nvmVersion}/install.sh | bash \
    && addToPathAndSource 'export NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' \
    && nvm install ${defaultNodeVersion} --no-progress \
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
    && sudo dnf -q install -y dnf-plugins-core \
    && sudo dnf config-manager \
      --add-repo \
      https://download.docker.com/linux/fedora/docker-ce.repo \
    && sudo dnf -q install -y docker \
    && sudo groupadd docker || true \
    && sudo usermod -aG docker vagrant \
    && sudo systemctl start docker \
    && sudo systemctl enable docker \
    && sudo mkdir /sys/fs/cgroup/systemd \
    && sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd \
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

# update kernel: maybe needed for guest additions? But maybe not?
# installAndUpdateKernel

installWget
installNano
installAtom
installGit

# zsh fuer Vorlesung nicht noetig (manchmal langsam / fehleranfaellig):
# installOhMyZsh

installOpenJdk
installMaven

# gradle: disabled beacause we use gradle wrapper and download page is often too slow
# installGradle

installFirefox

installNvm
installIntelliJ
installDocker
installDockerCompose
installGnome
setupLocale
setupWorkspace

# favorites: does not work yet - needs to be added to startup script instead
# setupFavoriteApps

cleanup
