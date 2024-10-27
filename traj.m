
initial_velocity = 50; 
launch_angle = 45; 
g = 9.81; 

launch_angle_rad = deg2rad(launch_angle);

vx = initial_velocity * cos(launch_angle_rad);
vy = initial_velocity * sin(launch_angle_rad); 

time_of_flight = 2 * vy / g;

t = linspace(0, time_of_flight, 100);

x = vx * t; 
y = vy * t - 0.5 * g * t.^2; 

max_height = (vy^2) / (2 * g);

range = vx * time_of_flight;

figure;
plot(x, y, 'b-', 'LineWidth', 1.5);
hold on;

plot(range, 0, 'ro', 'MarkerSize', 8, 'DisplayName', 'Range');
plot(range / 2, max_height, 'go', 'MarkerSize', 8, 'DisplayName', 'Max Height');

text(range, 0, sprintf(' Range = %.2f m', range), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(range / 2, max_height, sprintf(' Max Height = %.2f m', max_height), 'VerticalAlignment', 'top', 'HorizontalAlignment', 'center');

xlabel('Horizontal Distance (m)');
ylabel('Vertical Distance (m)');
title('Projectile Trajectory');
legend('Trajectory', 'Range', 'Max Height');
grid on;
axis equal;
hold off;