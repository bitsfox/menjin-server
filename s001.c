#include"clsscr.h"
/*服务端的tcp监听端，要实现的功能大致为3类：
  1、接受客户端的连接，根据收到的数据包类型，分别对数据进行生成asf文件的处理、或进行报警处理。
  2、调用外部命令ffmpeg将asf文件转换为mp4文件。并保存之指定目录。
  3、对新接受的文件及报警信息保存之mysql数据库中。
  4、
  
 							2014-05-12 tybitsfox
 */
char cname[100];
int daemon_init();
void smsg(char *ch);
int s_transmit();
//{{{ int main(int argc,char **argv)
int main(int argc,char **argv)
{
	int sock,i,j,c;
	fd_set fd;
	struct sockaddr_in sa,sa1;
	socklen_t len;
	pid_t pid;
	memset(cname,0,sizeof(cname));
	memcpy(cname,argv[0],strlen(argv[0]));
	i=daemon_init();
	if(i!=0)
		return 0;
	smsg("daemon init successful");
	memset((void*)&sa,0,sizeof(sa));
	sa.sin_family=AF_INET;
	sa.sin_port=htons(1103);
	sa.sin_addr.s_addr=htonl(INADDR_ANY);
	sock=socket(AF_INET,SOCK_STREAM,0);
	if(sock==-1)
	{
		smsg("error to create socket");
		exit(0);
	}
	i=bind(sock,(struct sockaddr*)&sa,sizeof(sa));
	if(i==-1)
	{
		smsg("error to bind");
		close(sock);
		exit(0);
	}
	i=listen(sock,5);
	if(i==-1)
	{
		smsg("listen error");
		close(sock);
		exit(0);
	}
	signal(SIGCHLD,SIG_IGN);
	while(1)
	{
		FD_ZERO(&fd);
		FD_SET(sock,&fd);
		select(sock+1,&fd,NULL,NULL,NULL);
		if(FD_ISSET(sock,&fd))
		{
			memset((void*)&sa1,0,sizeof(sa1));
			len=sizeof(sa1);
			c=accept(sock,(struct sockaddr*)&sa1,&len);
			if(c==-1)
			{
				smsg("accept error");
				//close(sock);
				//exit(0);
				continue;
			}
			pid=fork();
			if(pid>0)
			{//parent listen point 
				close(c);
				continue;
			}
			if(pid<0)
			{//fork error
				smsg("pid error");
				close(c);
				//close(s);
				//exit(0);
				continue;
			}
			if(pid==0)
			{//child transfer point
				close(sock);
				i=dup2(c,0);//
				if(i==-1)
				{
					smsg("dup2 error for stdin");
					close(c);
					exit(0);
				}
				i=dup2(c,1);
				if(i==-1)
				{
					smsg("dup2 error for stdout");
					close(c);
					close(0);
					exit(0);
				}
				i=dup2(c,2);
				if(i==-1)
				{
					smsg("dup2 error for stderr");
					close(c);
					close(0);
					close(1);
					exit(0);
				}
				s_transmit();
				exit(0);
			}
		}
	}
	exit(0);
}//}}}
//{{{ int daemon_init()
int daemon_init()
{
	int i;
	pid_t pid;
	pid=fork();
	if(pid!=0)
		return 1;
	if(setsid()<0)
		return 1;
	signal(SIGHUP,SIG_IGN);
	pid=fork();
	if(pid!=0)
		return 1;
	chdir("/");
	for(i=0;i<63;i++)
		close(i);
	open("/dev/null",O_RDONLY);
	open("/dev/null",O_RDWR);
	open("/dev/null",O_RDWR);
	return 0;
}//}}}
//{{{void smsg(char *ch);
void smsg(char *ch)
{
	openlog(cname,LOG_PID,LOG_USER);
	syslog(LOG_NOTICE,"%s\n",ch);
	closelog();
}//}}}
//{{{int s_transmit()
int s_transmit()
{
	fd_set fd;
	char buf[200];
	int i,j,k;
	while(1)
	{
		FD_ZERO(&fd);
		FD_SET(0,&fd);
		select(1,&fd,NULL,NULL,NULL);
		if(FD_ISSET(0,&fd))
		{
			memset(buf,0,sizeof(buf));
			i=read(0,buf,sizeof(buf));
			if(i<=0)
			{
				smsg("client closed");
				exit(0);
			}
			i=write(1,buf,sizeof(buf));
			if(i<=0)
			{
				smsg("write error");
				exit(0);
			}
		}
	}
	return 0;
}//}}}


