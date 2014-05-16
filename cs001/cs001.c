/*s001的客户端测试程序
 server port:1103
 */
#include"clsscr.h"

int main(int argc,char **argv)
{
	int i,j,k,s;
	char ch[200];
	fd_set fd;
	struct sockaddr_in sa;
	memset((void*)&sa,0,sizeof(sa));
	sa.sin_family=AF_INET;
	sa.sin_port=htons(1103);
	i=inet_pton(AF_INET,"localhost",&(sa.sin_addr.s_addr));
	if(i==-1)
	{
		printf("error to inet_pton\n");
		return 0;
	}
	s=socket(AF_INET,SOCK_STREAM,0);
	if(s==-1)
	{
		printf("create socket error\n");
		return 0;
	}
	i=connect(s,(struct sockaddr *)&sa,sizeof(sa));
	if(i==-1)
	{
		printf("connect error\n");
		close(s);
		return 0;
	}
	k=fileno(stdin);
	while(1)
	{
		FD_ZERO(&fd);
		FD_SET(k,&fd);
		FD_SET(s,&fd);
		j=s>k?s:k;
		select(j+1,&fd,NULL,NULL,NULL);
		if(FD_ISSET(k,&fd))
		{
			memset(ch,0,sizeof(ch));
			fgets(ch,sizeof(ch),stdin);
			i=strlen(ch);
			if(i<=1)
			{
				printf("exit\n");
				close(s);
				return 0;
			}
			j=send(s,ch,i,0);
			if(j<0)
			{
				printf("send error\n");
				close(s);
				return 0;
			}
		}
		if(FD_ISSET(s,&fd))
		{
			memset(ch,0,sizeof(ch));
			i=recv(s,ch,sizeof(ch),0);
			if(i<=0)
			{
				printf("recv error\n");
				close(s);
				return 0;
			}
			printf("%s",ch);
		}
	}
	return 0;
}



