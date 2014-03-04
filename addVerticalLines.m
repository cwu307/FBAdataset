%plot straight line markers
%input : matrix2plot = vector to be plotted
%        lineLoc =     location of the vertical lines

function addVerticalLines(matrix2plot, lineLoc)

L = length(lineLoc);

yMax = max(matrix2plot);
yMin = min(matrix2plot);

for i = 1:L
    
    yVal = linspace(yMin,yMax, 100);
    xVal = lineLoc(i)*ones(1,length(yVal));
    mark = mod(i ,2);
    if (mark == 1)
        plot(xVal, yVal, 'r');
        hold on
    elseif (mark == 0)
        plot(xVal, yVal, '--r');
        hold on
    end
end

plot(matrix2plot);
axis tight