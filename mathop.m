function mathop

s = RandStream('mt19937ar','Seed','shuffle');
RandStream.setGlobalStream(s);

xspan = 6;
yspan = -8;

fileID = fopen('mathop.txt','w');
fprintf(fileID,'\\begin{tikzpicture}\n\n');
for i=1:6
    items=floor(rand()*7);
    if items==0
        hour = floor(rand()*12)+1;
        minute = floor(rand()*59);
        str = drawclock(hour,minute,rand()>0.5,mod(i,3)*xspan,yspan*(floor(i/4)==1)-2.0);
    elseif items==1 || items==2 || items==3
        multiplicand = floor(rand()*499);
        multiplier = floor(rand()*199);
        str = timesop(multiplicand,multiplier,rand()>0.5,mod(i,3)*xspan,yspan*(floor(i/4)==1));
    else
        divisor = floor(rand()*39);
        while divisor == 0
          divisor = floor(rand()*39);
        end
        dividend = divisor*floor(rand()*39);
        str = divop(dividend,divisor,rand()>0.5,mod(i,3)*xspan,yspan*(floor(i/4)==1));
    end
    fprintf(fileID,'%s\n\n',str);
end

  fprintf(fileID,'\\end{tikzpicture}\n\n');
% 
%   fprintf(fileID,'\\vspace{-0.0cm}\\begin{align*}\n');
%   fprintf(fileID,'%s\n',timestable19(3,1));
%   fprintf(fileID,'%s\n',timestable19(3,0));
%   fprintf(fileID,'%s\n',timestable19(3,2));
%   fprintf(fileID,'\\end{align*}\n\n');

  fprintf(fileID,'\\vspace{1.5cm}\\begin{align*}\n');
  fprintf(fileID,'%s\n',opplusmultipnull(3));
  fprintf(fileID,'%s\n',opplusmultipnull(3));
  fprintf(fileID,'%s\n',opplusmultipnull(3));
  fprintf(fileID,'%s\n',opplusmultipnull(3));
  fprintf(fileID,'%s\n',oppdivisor(3));
  fprintf(fileID,'%s\n',fraction(3));
  fprintf(fileID,'\\end{align*}\n\n');
  fclose(fileID);

end

function str=fraction(count)
  str='';
  for c=1:count
    result = 2;
    while (result > 1)
      nums = floor(rand(2,1)*10)+1;
      nums = nums/gcd(nums(1,1),nums(2,1));
      denomi1 = max(nums);
      if (denomi1 == 1)
        denomi1 = denomi1 + floor(rand()*10);
      end
      nomi1 = min(nums);
      nums = floor(rand(2,1)*10)+1;
      nums = nums/gcd(nums(1,1),nums(2,1));
      denomi2 = max(nums);
      if (denomi2 == 1)
        denomi2 = denomi2 + floor(rand()*10);
      end
      nomi2 = min(nums);
      result = nomi1/denomi1+nomi2/denomi2;
    end
    str = strcat(str,sprintf('&\\frac{%d}{%d}+',nomi1,denomi1));
    str = strcat(str,sprintf('\\frac{%d}{%d}',nomi2,denomi2));
    str = strcat(str,sprintf('=\\underline{\\qquad\\qquad}&'));
  end
  str = strcat(str,'\\[10pt]');
end

function str=oppdivisor(count)
  str = '';
  primes = [2,3,5,7,11];
  for c=1:count
    nums = floor(rand()*2)+2;
    ind = floor(rand(nums,1)*length(primes))+1;
    str = strcat(str,'&');
    str = strcat(str,sprintf('%d ',prod(primes(ind))));
    str = strcat(str,sprintf('='));
    for i=1:length(ind)-1
      str = strcat(str,sprintf('\\underline{\\qquad}\\times'));
    end
    str = strcat(str,sprintf('\\underline{\\qquad}&'));
  end
  str = strcat(str,'\\[10pt]');
end

function str=opplusmultipnull(count)
    str = '';
    for c=1:count
        op = floor(rand()*7);
        if op==0 % + null
            opnum = zeros(4,1);
            str = strcat(str,'&');
            null = floor(rand()*4)+1;
            for i=1:4
                if i<4
                  opnum(i) = floor(rand()*199);
                  opnum(end) = opnum(end)+opnum(i);
                end
                if i~=null
                    str = strcat(str,sprintf('%d ',opnum(i)));
                else
                    str = strcat(str,sprintf('\\underline{\\qquad\\qquad} '));
                end
                if i~=4
                    if i<3
                        str = strcat(str,sprintf('+ '));
                    else
                        str = strcat(str,sprintf('= '));
                    end
                end
            end
        elseif op==1  % * null
            opnum = zeros(4,1);
            str = strcat(str,'&');
            null = floor(rand()*4)+1;
            opnum(end) = 1;
            for i=1:4
                if i<4
                  opnum(i) = floor(rand()*19);
                  opnum(end) = opnum(end)*opnum(i);
                end
                if i~=null
                    str = strcat(str,sprintf('%d ',opnum(i)));
                else
                    str = strcat(str,sprintf('\\underline{\\qquad\\qquad} '));
                end
                if i~=4
                    if i<3
                        str = strcat(str,sprintf('\\times '));
                    else
                        str = strcat(str,sprintf('= '));
                    end
                end
            end
        elseif op==2  % - null
            str = strcat(str,'&');
            num = 3;
            opnum = zeros(num,1);
            null = floor(rand()*3)+1;
            opnum(end) = floor(rand()*199);
            opnum(2) = floor(rand()*199);
            opnum(1) = opnum(end)+opnum(2);
            for i=1:num
                if i~=null
                    str = strcat(str,sprintf('%d ',opnum(i)));
                else
                    str = strcat(str,sprintf('\\underline{\\qquad\\qquad} '));
                end
                if i~=num
                    if i<num-1
                        str = strcat(str,sprintf('- '));
                    else
                        str = strcat(str,sprintf('= '));
                    end
                end
            end
        elseif op==3  % div null
            str = strcat(str,'&');
            num = 3;
            opnum = zeros(num,1);
            null = floor(rand()*num)+1;
            opnum(end) = floor(rand()*29);
            opnum(2) = floor(rand()*29);
            while opnum(2)==0
                opnum(2) = floor(rand()*29);
            end
            opnum(1) = opnum(end)*opnum(2);
            for i=1:num
                if i~=null
                    str = strcat(str,sprintf('%d ',opnum(i)));
                else
                    str = strcat(str,sprintf('\\underline{\\qquad\\qquad} '));
                end
                if i~=num
                    if i<num-1
                        str = strcat(str,sprintf('\\div '));
                    else
                        str = strcat(str,sprintf('= '));
                    end
                end
            end
        elseif op==4  % 15x16=
            multiplicand = floor(rand()*10)+10;
            multiplier = floor(rand()*10)+10;
            str = strcat(str,sprintf('&%d\\times %d =\\underline{\\qquad\\qquad}',multiplicand,multiplier));
        elseif op==5  % 15/3=
            multiplicand = floor(rand()*15);
            multiplier = floor(rand()*15);
            while multiplier ==0
              multiplier = floor(rand()*20);
            end
            product = multiplicand*multiplier;
            str = strcat(str,sprintf('&%d\\div %d =\\underline{\\qquad\\qquad}',product,multiplier));
        elseif op==6  % 23x27=
            multiplicand = floor(rand()*90)+10;
            ten = floor(multiplicand/10);
            one = 10 - (multiplicand - ten*10);
            multiplier = ten*10+one;
            str = strcat(str,sprintf('&%d\\times %d =\\underline{\\qquad\\qquad}',multiplicand,multiplier));
        end
        str = strcat(str,sprintf('&'));
    end
        str = strcat(str,'\\[10pt]');
end

function str=timestable19(count,multip)
    str = '';
    if multip==1      % times
        for i=1:count
            multiplicand = floor(rand()*10)+10;
            multiplier = floor(rand()*10)+10;
            str = strcat(str,sprintf('%d\\times %d &=\\underline{\\qquad\\qquad}&',multiplicand,multiplier));
        end
        str = str(1:end-1);
        str = strcat(str,'\\[10pt]');
    elseif multip==0      % divide
        for i=1:count
            multiplicand = floor(rand()*15);
            multiplier = floor(rand()*15);
            while multiplier ==0
              multiplier = floor(rand()*20);
            end
            product = multiplicand*multiplier;
            str = strcat(str,sprintf('%d\\div %d &=\\underline{\\qquad\\qquad}&',product,multiplier));
        end
        str = str(1:end-1);
        str = strcat(str,'\\[10pt]');
    else
        for i=1:count
            multiplicand = floor(rand()*90)+10;
            ten = floor(multiplicand/10);
            one = 10 - (multiplicand - ten*10);
            multiplier = ten*10+one;
            str = strcat(str,sprintf('%d\\times %d &=\\underline{\\qquad\\qquad}&',multiplicand,multiplier));
        end
        str = str(1:end-1);
        str = strcat(str,'\\[10pt]');
    end
end

function str=divop(dividend,divisor,show,x,y)
    if show==1
        b = 'b';
    else
        b = 'B';
    end
    str = '';

    quotient = floor(dividend/divisor);
    remaid = mod(dividend,divisor);
    dividend_str = int2str(dividend);
    divisor_str = int2str(divisor);
    quotient_str = int2str(quotient);
    remaid_str = int2str(remaid);
    dividend_width = length(dividend_str);
    divisor_width = length(divisor_str);
    quotient_width = length(quotient_str);
    remaid_width = length(remaid_str);
    width = dividend_width + 2;
    height = 3 + 3*quotient_width;
    
    lines = zeros(quotient_width,3);
    
    matrix_drawt = 'u'*ones(height,width);
    matrix_drawt(1,end-quotient_width+1:end) =  b*ones(1,quotient_width);
    matrix_drawt(2,end) = 'l';
    matrix_drawt(3,1) = 'i';
    matrix_drawt(3,2) = 'r';
    matrix_drawt(3,3:end) = dividend_str;
    for i=1:quotient_width
        temp = divisor*str2double(quotient_str(i));
        temp_len = length(int2str(temp));
        matrix_drawt(i*3+1,end-quotient_width+i-temp_len+1:end-quotient_width+i) =  b*ones(1,temp_len);
        matrix_drawt(i*3+2,end) = 'l';
        matrix_drawt(i*3+3,3:end) = 'B'*ones(1,width-2);
        matrix_drawt(i*3+3,end-quotient_width+i-temp_len+1:end-quotient_width+i) =  b*ones(1,temp_len);
        matrix_drawt(i*3+3,end-quotient_width+i+1:end) =  'B'*ones(1,quotient_width-i);
        lines(i,1) = i*3+3;lines(i,2) =width-quotient_width+i-temp_len+1;
        lines(i,3) =width-quotient_width+i;
        if i<quotient_width
          matrix_drawt(i*3+3,end-quotient_width+i+1) =  b;
          lines(i,3) = lines(i,3) + 1;
        end
    end
    matrix_drawt(end,3:end) = 'B'*ones(1,width-2);
    matrix_drawt(end,end-remaid_width+1:end) =  b*ones(1,remaid_width);
    
    str = strcat(str,sprintf('\\begin{scope}[shift={(%f,%f)}]',x,y));
    str = strcat(str,sprintf('\\node (op) {$%d\\div %d=\\underline{\\qquad\\qquad}$};',dividend,divisor));
    str = strcat(str,'\matrix[matrix of math nodes,below=of op] (m){');
    for j=1:height
        for i=1:width
            str = strcat(str,sprintf('%s&',slot(matrix_drawt(j,i))));
        end
        str = strcat(str,sprintf('\\\\\n'));
    end
    str = strcat(str,'};');
    if show==1
        for i=1:quotient_width
            str = strcat(str,sprintf('\\draw[thick] (m-%d-%d.north west) -- (m-%d-%d.north east);',lines(i,1),lines(i,2),lines(i,1),lines(i,3)));
        end
    end
    str = strcat(str,sprintf('\\draw[thick] (m-3-3.north west) -- (m-3-%d.north east);',width));
    str = strcat(str,'\end{scope}');
    str = strrep(str,'\divisor',divisor_str);
end

function str=timesop(multiplicand,multiplier,show,x,y)
    if show==1
        b = 'b';
    else
        b = 'B';
    end
    str = '';
    
    product = multiplicand * multiplier;
    multiplicand_str = int2str(multiplicand);
    multiplier_str = int2str(multiplier);
    product_str = int2str(product);
    multiplicand_width = length(multiplicand_str);
    multiplier_width = length(multiplier_str);
    product_width = length(product_str);
    if product_width==max(multiplicand_width,multiplier_width);
        width = product_width + 1;
    else
        width = product_width;
    end

    if multiplier_width~=1
      matrix_drawt = zeros(5+multiplier_width,width);
    else
      matrix_drawt = zeros(4,width);
    end
    matrix_drawt(1,:) = 'u'*ones(1,width);
    matrix_drawt(1,end-multiplicand_width+1:end) = multiplicand_str;
    matrix_drawt(2,:) = 'u'*ones(1,width);
    matrix_drawt(2,1) = 'x';
    matrix_drawt(2,end-multiplier_width+1:end) = multiplier_str;
    matrix_drawt(3,:) = 'l'*ones(1,width);
    if multiplier_width~=1
      matrix_drawt(end-1,:) = 'l'*ones(1,width);
      for i=4:4+multiplier_width-1
          temp = multiplicand * str2double(multiplier_str(end-i+4));
          temp_len = length(int2str(temp));
          if temp==0
              matrix_drawt(i,:) = 'l'*ones(1,width);
          else
              matrix_drawt(i,:) = 'B'*ones(1,width);
              matrix_drawt(i,end-temp_len+1-i+4:end-i+4) =  b*ones(1,temp_len);
          end
      end
    end
    matrix_drawt(end,:) = 'B'*ones(1,width);
    matrix_drawt(end,end-product_width+1:end) = b*ones(1,product_width);

    str = strcat(str,sprintf('\\begin{scope}[shift={(%f,%f)}]',x,y));
    str = strcat(str,sprintf('\\node (op) {$%d\\times %d=\\underline{\\qquad\\qquad}$};',multiplicand,multiplier));
    str = strcat(str,'\matrix[matrix of math nodes,below=of op] (m){');
    for j=1:size(matrix_drawt,1)
        for i=1:width
            str = strcat(str,sprintf('%s&',slot(matrix_drawt(j,i))));
        end
        str = strcat(str,sprintf('\\\\\n'));
    end
    str = strcat(str,'};');
    str = strcat(str,sprintf('\\draw[thick] (m-4-1.north west) -- (m-4-%d.north east);',width));
    if show==1
        if multiplier_width~=1
          str = strcat(str,sprintf('\\draw[thick] (m-%d-1.north west) -- (m-%d-%d.north east);',5+multiplier_width,5+multiplier_width,width));
        end
    end
    str = strcat(str,'\end{scope}');
end

function r=slot(str)
    if str=='u'
        r = '';                  % null
    elseif str=='x'
        r = '\num{\times}';
    elseif str=='b'
        r = '\nul';             % frame, non-number
    elseif str=='B'
        r = '\nulls';           % non-frame, non-number
    elseif str=='l'
        r = '\lin';               % virture-line
    elseif str=='r'
        r = '\arcs';
    elseif str=='i'
        r = '\num{\divisor}';
    else
        r = strcat('\num{',str,'}');
    end
end

function str=drawclock(hour,minute,show,x,y)
    str = '';
    str = strcat(str,sprintf('\\begin{scope}[shift={(%f,%f)}]',x,y));
    str = strcat(str,sprintf('\\clocks{%d}{%d}{%d}',hour,minute,show));
    str = strcat(str,'\end{scope}');
end