
% Area - функция вычисления площади под графиком кривой, заданной точками.
% Кривая задаётся векторами х и у. Вектор х хранит координату Х точек.
% Вектор у хранит координату У точек. Функция возвращает скалярное 
% значение, равное значению площади под графиком, заданным точками.
% Ограничения на входные данные: нет.

% Пример 1.
% x = [-3 -2 -1 0 1  3 4]
% y = [3 4 1 2 4 7 2 2]
% Area(x, y)

% Пример 2.
% x = [-4 -3 -2 -1 0 1  3 4]
% y = [2 3 0 -1 0 1 4 3 4]
% Area(x, y)

% Пример 3.
% x = [-4 -3 -1 2 3 4]
% y = [2 3 -1 4 3 4]
% Area(x, y)

function [ area ] = Area( x, y )
    area = 0;
    for i = 2 : length(x)
        cx = x(i); cy = y(i); px = x(i - 1); py = y(i - 1);
        if (cx == px) 
            continue
        elseif ((cy > 0 && py > 0) || (cy < 0 && py < 0))
            d1 = sqrt((cx - px) ^ 2 + (cy - py) ^ 2);
            d2 = abs(cx - px);
            d3 = abs(cy);
			d4 = abs(py);
			d5 = sqrt((cx - px) ^ 2 + py ^ 2);
			p1 = (d1 + d3 + d5) / 2;
			p2 = (d2 + d4 + d5) / 2;
			s1 = sqrt(p1 * (p1 - d1) * (p1 - d3) * (p1 - d5));
			s2 = sqrt(p2 * (p2 - d2) * (p2 - d4) * (p2 - d5));
			area = area + s1 + s2;
        elseif (cy == 0 || py == 0)
            d1 = sqrt((cx - px) ^ 2 + (cy - py) ^ 2);
			d2 = abs(cx - px);
			d3 = abs(cy + py);
			p = (d1 + d2 + d3) / 2;
            s = sqrt(p * (p - d1) * (p - d2) * (p - d3));
			area = area + s;
        else
            a = ((cx - px) * py) / (-(cx - px) * (cy - py));
            mx = px + a * (cx - px); 
            d1 = sqrt((mx - px) ^ 2 + py ^ 2);
			d2 = abs(mx - px);
			d3 = abs(py);
			p = (d1 + d2 + d3) / 2;
            s1 = sqrt(p * (p - d1) * (p - d2) * (p - d3));
            d1 = sqrt((mx - cx) ^ 2 + cy ^ 2);
			d2 = abs(mx - cx);
			d3 = abs(cy);
			p = (d1 + d2 + d3) / 2;
            s2 = sqrt(p * (p - d1) * (p - d2) * (p - d3));
            area = area + s1 + s2;
        end
    end
end