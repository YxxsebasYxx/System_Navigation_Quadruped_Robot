# Imagen base con ROS 2 Jazzy y GZ/Harmonic
FROM osrf/ros:jazzy-desktop

# Configuración del entorno
ENV DEBIAN_FRONTEND=noninteractive
ENV ROS_DISTRO=jazzy

# Instala dependencias de desarrollo y ros_gz (para Gazebo Harmonic)
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-colcon-common-extensions \
    python3-pip \
    git \
    wget \
    ros-jazzy-ros-gz \
    && rm -rf /var/lib/apt/lists/*

# Crea el workspace dentro del contenedor
WORKDIR /ros2_ws

# Copia solo los archivos necesarios (modifica si tu workspace es más complejo)
COPY ./src ./src

# Sourcing de ROS y compilación del workspace
RUN . /opt/ros/$ROS_DISTRO/setup.sh && \
    colcon build --symlink-install

# Fuente del workspace al iniciar contenedor
CMD ["/bin/bash"]

