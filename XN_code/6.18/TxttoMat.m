% ���ȣ���lvm��������txt��Ŀ¼�£�Ȼ�������������ļ�bash.sh��Ȼ������TxtToMat
% load txtĿ¼�µ�.txt�����ļ�����matĿ¼�´�Ϊ.mat

% ��ȡ�ļ�����ʱ��
mydir='Users/yin/Desktop/data/';
mydir_mat=[mydir(1:end-1),'_mat/' ];
aa=dir([mydir,'*I0.txt']);

%ʱ�䶼��i�Ĵ���ʱ��
dates={aa(:).date};

% cali=-70;
% mydir='D:\wireless_new\wgj_3_4(hf)\';
% mydir_mat='D:\wireless_new\wgj_3_4(hf)_mat\';
% aa=dir([mydir,'*0.txt']);
% dates={aa(:).date};
% mydir='E:\ʵ����\1103_Ф���Ĵ��������\';
% directory=dir(([mydir,'*.txt']));
% dd = dir(([mydir,'*0.txt']));
% directory=directory(~ismember({directory.name},{dd.name}));
% num=length(directory);
num=size(aa,1);
 for i1=1:num
  
  filename=[mydir,aa(i1).name];
  filename=[filename(1:end-5),'.txt']
  I=load(filename);
  
  %smooth
  filenameQ=[filename(1:end-5),'Q.txt']
  Q=load(filenameQ);
  min_len=min(length(I),length(Q));
  z=complex(I(1:min_len),Q(1:min_len));
%   d=smooth(abs(z),4000);  %abs��ֵ,smooth����Χ4000�������ƶ�ƽ���˲���Ĭ�ϵ�ͨ�˲�
%   d=downsample(d,10000);
%   
%   
%   
%   filename_new=[mydir_mat,aa(i1).name];
%   filename_new=[filename_new(1:end-7),'.mat'];
% % % % % %   save(filename_new, 'd');
% % % % % % % % %   d=load(filename_new);
%   a.d=d;
%   time1=dates{i1};
%   time1=[time1(7:10),'0',time1(4),time1(1:2),time1(12:13),time1(15:16),time1(18:19)];
% % % % % % % % %   time2=add_time(time1,cali);
%   a.date=time1;
%   save(filename_new, 'a');
  
% % % % % % % % % % %   temp=dlmread(filename,'',0,1);
% % % % % % % % % % %   eval_r([temp1(i1).name(1:end-4),'=temp;'])
% % % % % % % % % % %   dlmread��fopen�Ȳ����Ͳ�����д�ˣ��뵥���ļ�һ����
 end