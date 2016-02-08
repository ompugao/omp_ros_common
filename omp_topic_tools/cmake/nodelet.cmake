macro(omp_nodelet _nodelet_cpp _nodelet_class _single_nodelet_exec_name _CODE_PARAM_NAME)
  list(APPEND ${_CODE_PARAM_NAME} ${_nodelet_cpp})
  set(NODELET ${_nodelet_class})
  set(DEFAULT_NODE_NAME ${_single_nodelet_exec_name})
  if(omp_topic_tools_SOURCE_DIR)
    set(_omp_topic_tools_SOURCE_DIR ${omp_topic_tools_SOURCE_DIR})
  elseif(omp_topic_tools_SOURCE_PREFIX)
    set(_omp_topic_tools_SOURCE_DIR ${omp_topic_tools_SOURCE_PREFIX})
  else(omp_topic_tools_SOURCE_PREFIX)
    set(_omp_topic_tools_SOURCE_DIR ${omp_topic_tools_PREFIX}/share/omp_topic_tools)
  endif()
  configure_file(
    ${_omp_topic_tools_SOURCE_DIR}/cmake/single_nodelet_exec.cpp.in
    ${_single_nodelet_exec_name}.cpp)
  add_executable(${_single_nodelet_exec_name} ${_single_nodelet_exec_name}.cpp)
  target_link_libraries(${_single_nodelet_exec_name} ${catkin_LIBRARIES})
  if (${ARGC} GREATER 4)
    list(APPEND ${ARGV4} ${_single_nodelet_exec_name})
  endif(${ARGC} GREATER 4)
  install(TARGETS ${_single_nodelet_exec_name}
    RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
    ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
    LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION})
endmacro(omp_nodelet _nodelet_cpp _nodelet_class _single_nodelet_exec_name _CODE_PARAM_NAME)
