#Environment
HOME_DIR=/home/vagrant
DOWNLOAD_DIR=${HOME_DIR}/Download

#Wget
echo "INSTALLING WGET" \
  && sudo dnf -q install -y wget \
  && echo "WGET DONE"

#Nano
echo "INSTALLING NANO" \
  && sudo dnf -q install -y nano \
  && echo "NANO DONE"

#Git
echo "INSTALLING GIT" \
  && sudo dnf -q install -y git \
  && echo "GIT DONE"

#Atom
echo "INSTALLING ATOM" \
  && sudo rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey \
  && sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo' \
  && sudo dnf -q install -y atom \
  && echo "ATOM DONE"

#Java (Open JDK)
echo "INSTALLING OPENJDK" \
  && sudo dnf -q install -y java-1.8.0-openjdk-devel \
  && echo "OPENJDK DONE"

#Maven
echo "INSTALLING MAVEN" \
  && wget -q http://www-eu.apache.org/dist/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz -P ${DOWNLOAD_DIR} \
  && sudo mkdir /opt/maven \
  && sudo tar xzf ${DOWNLOAD_DIR}/apache-maven-3.6.0-bin.tar.gz -C /opt/maven --strip-components=1 \
  && sudo chown -R vagrant:vagrant /opt/maven \
  && echo "MAVEN DONE"

#Gradle
echo "INSTALLING GRADLE" \
  && wget -q https://services.gradle.org/distributions/gradle-5.1.1-bin.zip -P ${DOWNLOAD_DIR} \
  && unzip -q ${DOWNLOAD_DIR}/gradle-5.1.1-bin.zip -d ${DOWNLOAD_DIR} \
  && sudo mv ${DOWNLOAD_DIR}/gradle-5.1.1 /opt/gradle \
  && sudo chown -R vagrant:vagrant /opt/gradle \
  && echo "GRADLE DONE"

#NodeJS
echo "INSTALLING NODEJS" \
  && sudo curl -sL https://rpm.nodesource.com/setup_11.x | sudo bash - \
  && sudo dnf -q install -y nodejs \
  && echo "NODEJS DONE"

#Firefox
echo "INSTALLING FIREFOX" \
  && sudo dnf -q install -y firefox \
  && echo "FIREFOX DONE"

#oh-my-zsh
echo "INSTALLING OH MY ZSH" \
  && sudo dnf -q install -y zsh \
  && git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME_DIR}/.oh-my-zsh \
  && cp /vagrant/.zshrc ${HOME_DIR}/.zshrc \
  && sudo usermod -s /bin/zsh vagrant \
  && echo "ZSH DONE"

#IntelliJ
echo "INSTALLING INTELLIJ" \
  && wget -q https://download.jetbrains.com/idea/ideaIU-2018.3.3.tar.gz -P ${DOWNLOAD_DIR} \
  && sudo mkdir /opt/intellij \
  && sudo tar xzf ${DOWNLOAD_DIR}/ideaIU-2018.3.3.tar.gz -C /opt/intellij --strip-components=1 \
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

#Gnome
echo "INSTALLING GNOME" \
  && sudo dnf -q groupinstall -y gnome-desktop base-x \
  && sudo systemctl set-default graphical.target \
  && echo "GNOME DONE"

#Locale
echo "SETTING UP LOCALE" \
  && sudo localectl set-x11-keymap ch \
  && sudo timedatectl set-timezone Europe/Zurich \
  && echo "LOCALE DONE"

#Cleanup
echo "CLEAN UP" \
  && sudo rm -rf ${DOWNLOAD_DIR}/* \
  && echo "CLEAN UP DONE"
