
% Time - функция вычисления времени кривой, заданной точками.
% Кривая задаётся векторами х и у. Вектор х хранит координату Х точек.
% Вектор у хранит координату У точек.
% Функция возвращает скалярное значение, равное значению времени.
% Ограничения на входные данные: точность значений внутри векторов 
% х и у не должна превышать 10 знаков после запятой.

% Пример 1.
% x = [10 10 0 0]
% y = [0 5 5 0]
% Time(x, y)

% Пример 2.
% x = [10 9 1 0]
% y = [0 4 5 0]
% Time(x, y)

function [ time ] = Time( x, y )
    count = 1;
    time = 0;
    for i = 1 : length(x)
        d = x(i) * count;
        while 1
            a = num2str(d, 10);
            d = str2double(a);
            if mod(d, 1) == 0
                break;
            end
            d = d * 10;
            count = count * 10;
        end
    end
    for i = 1 : length(x)
        x(i) = str2double(num2str(x(i) * count, 10));
        y(i) = str2double(num2str(y(i) * count, 10));
    end
    for i = 2 : length(x)
        px = x(i - 1); cx = x(i); dx = px;
        py = y(i - 1); cy = y(i); dy = py;
        count = abs(cx - px);
        if (count == 0)
            continue;
        end
        for j = 1 : count
            incx = (cx - px) / count;
            dx = dx + incx;
            interp = py + (cy - py) / (cx - px) * (dx - px);
            avg = (dy + interp) / 2;
            time = time + (abs(incx) / abs(avg));
            dy = interp;
        end
    end
end