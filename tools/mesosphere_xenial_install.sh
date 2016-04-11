# Install Mesos, Zookeeper, Chronos and Marathon

# Add Key and Repository
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
#DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
#CODENAME=$(lsb_release -cs)
#echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list

# Specific to Xenial Beta 2 (Let's Pretend!)
echo "deb http://repos.mesosphere.io/ubuntu vivid main" | sudo tee /etc/apt/sources.list.d/mesosphere.list

# For Older Systems, Install the Java 8 Runtime
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get -y update
#sudo apt-get install -y oracle-java8-installer
#sudo apt-get install -y oracle-java8-set-default

# Run Your Update (Or You Shall Not Pass!)
sudo apt-get -y update

# On Masters, Install Zookeeper, Mesos, Chronos and Marathon

sudo apt-get install -y mesos marathon zookeeper chronos

# On Slaves, Install Mesos
#sudo apt-get install -y mesos

# Configure Mesos
echo $(ec2metadata --local-ipv4) | sudo tee /etc/mesos-master/ip
sudo cp /etc/mesos-master/ip /etc/mesos-master/hostname

# Configure Marathon
sudo mkdir -p /etc/marathon/conf
sudo cp /etc/mesos-master/hostname /etc/marathon/conf

# Define Zookeeper Master for Marathon
sudo cp /etc/mesos/zk /etc/marathon/conf/master

