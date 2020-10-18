% 首先，把lvm拷贝到“txt”目录下，然后运行批处理文件bash.sh，然后运行TxtToMat
% load txt目录下的.txt数据文件，在mat目录下存为.mat

% 获取文件创建时间
mydir='Users/yin/Desktop/data/';
mydir_mat=[mydir(1:end-1),'_mat/' ];
aa=dir([mydir,'*I0.txt']);

%时间都按i的创建时间
dates={aa(:).date};

% cali=-70;
% mydir='D:\wireless_new\wgj_3_4(hf)\';
% mydir_mat='D:\wireless_new\wgj_3_4(hf)_mat\';
% aa=dir([mydir,'*0.txt']);
% dates={aa(:).date};
% mydir='E:\实验室\1103_肖宁的代码和数据\';
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
%   d=smooth(abs(z),4000);  %abs幅值,smooth对周围4000个数据移动平均滤波，默认低通滤波
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
% % % % % % % % % % %   dlmread，fopen等操作就不需详写了！与单个文件一样。
 end