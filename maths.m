slength = 6;
scell=cell(slength,1);
i = 0;

i = i+1;
s=['  \item',char(13,10)',...
     '    \begin{minipage}[t]{1.1\linewidth}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=.9\linewidth]{./mathfigs/s002.png}}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=6.5cm]{./mathfigs/s001.png}}',char(13,10)',...
     '    \end{minipage}\vspace{0.5cm}',char(13,10)'];
scell(i,1)={s};

i = i+1;
s=['  \item',char(13,10)',...
     '    \begin{minipage}[t]{1.1\linewidth}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=.9\linewidth]{./mathfigs/s004.png}}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=3.2in]{./mathfigs/s003.png}}',char(13,10)',...
     '    \end{minipage}\vspace{0.5cm}',char(13,10)'];
scell(i,1)={s};

i = i+1;
s=['  \item',char(13,10)',...
     '    \begin{minipage}[t]{1.1\linewidth}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=.9\linewidth]{./mathfigs/s005.png}}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=0.8in]{./mathfigs/s006.png}}',char(13,10)',...
     '    \end{minipage}\vspace{0.5cm}',char(13,10)'];
scell(i,1)={s};

i = i+1;
s=['  \item',char(13,10)',...
     '    \begin{minipage}[t]{1.1\linewidth}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=.9\linewidth]{./mathfigs/s008.png}}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=6.4cm]{./mathfigs/s007.png}}',char(13,10)',...
     '    \end{minipage}\vspace{0.5cm}',char(13,10)'];
scell(i,1)={s};

i = i+1;
s=['  \item',char(13,10)',...
     '    \begin{minipage}[t]{1.1\linewidth}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=.9\linewidth]{./mathfigs/s010.png}}',char(13,10)',...
     '        \begin{tikzpicture}',char(13,10)',...
     '          \draw[thick] (0,0) rectangle (2in,1in);',char(13,10)',...
     '        \end{tikzpicture}\\',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=.9\linewidth]{./mathfigs/s011.png}}',char(13,10)',...
     '    \end{minipage}\vspace{0.5cm}',char(13,10)'];
scell(i,1)={s};

i = i+1;
s=['  \item',char(13,10)',...
     '    \begin{minipage}[t]{1.1\linewidth}',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=.9\linewidth]{./mathfigs/s012.png}}',char(13,10)',...
     '        \begin{tikzpicture}',char(13,10)',...
     '          \draw[thick] (0,0) -- (.662in,-0.75in);',char(13,10)',...
     '          \draw[thick] (.662in,-0.75in) -- (2.516in,0in);',char(13,10)',...
     '          \draw[thick] (2.516in,0in) -- (6.516in,0in);',char(13,10)',...
     '        \end{tikzpicture}\\',char(13,10)',...
     '      \adjustbox{valign=t}{\includegraphics[width=.9\linewidth]{./mathfigs/s014.png}}',char(13,10)',...
     '    \end{minipage}\vspace{0.5cm}',char(13,10)'];
scell(i,1)={s};


fileID = fopen('maths.txt','w');
fprintf(fileID,'\\begin{enumerate}\n');

figa = dir('./mathfigs/a*');
figb = dir('./mathfigs/b*');
figc = dir('./mathfigs/c*');
figd = dir('./mathfigs/d*');
a = length(figa);
b = length(figb)/2;
c = length(figc)/3;
d = length(figd)/4;
all = a+b+c+d+slength;
p = randperm(all);

for i=1:all
  if p(i) <= a
    j = p(i);
    fprintf(fileID,'  \\item\n');
    fprintf(fileID,'    \\begin{minipage}[t]{1.1\\linewidth}\n');
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figa(j).name);
    fprintf(fileID,'    \\end{minipage}\\vspace{1.5cm}\n');
  elseif p(i) <= a+b
    j = p(i)-a-1;
    fprintf(fileID,'  \\item\n');
    fprintf(fileID,'    \\begin{minipage}[t]{1.1\\linewidth}\n');
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figb(j*2+1).name);
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figb(j*2+2).name);
    fprintf(fileID,'    \\end{minipage}\n');
  elseif p(i) <= a+b+c
    j = p(i)-a-b-1;
    fprintf(fileID,'  \\item\n');
    fprintf(fileID,'    \\begin{minipage}[t]{1.1\\linewidth}\n');
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figc(j*3+1).name);
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figc(j*3+2).name);
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figc(j*3+3).name);
    fprintf(fileID,'    \\end{minipage}\n');
  elseif p(i) <= a+b+c+d
    j = p(i)-a-b-c-1;
    fprintf(fileID,'  \\item\n');
    fprintf(fileID,'    \\begin{minipage}[t]{1.1\\linewidth}\n');
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figd(j*4+1).name);
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figd(j*4+2).name);
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figd(j*4+3).name);
    fprintf(fileID,'      \\adjustbox{valign=t}{\\includegraphics[width=.9\\linewidth]{./mathfigs/%s}}\n',figd(j*4+4).name);
    fprintf(fileID,'    \\end{minipage}\n');
  else
    j = p(i)-a-b-c-d;
    fprintf(fileID,'%s',scell{j,1});
  end
end

fprintf(fileID,'\\end{enumerate}\n');
fclose(fileID);


