FROM openjdk:8-jdk

WORKDIR /home/project

COPY Back/BE /home/project/BE
COPY setting.sh /home/project/
RUN chmod 755 /home/project/BE
RUN chmod +x /home/project/setting.sh


RUN apt update && apt install -y vim curl net-tools wget unzip lsof
RUN wget https://services.gradle.org/distributions/gradle-4.10.2-bin.zip \
    && mkdir /opt/gradle \
    && unzip -d /opt/gradle gradle-4.10.2-bin.zip \
    && export PATH=$PATH:/opt/gradle/gradle-4.10.2/bin \
    && echo 'export PATH=$PATH:/opt/gradle/gradle-4.10.2/bin' >> ~/.bashrc
RUN cd /home/project/BE \
    && chmod +x gradlew \
    && ./gradlew build

ENTRYPOINT ["./setting.sh"]

