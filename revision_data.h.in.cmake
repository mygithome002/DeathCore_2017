#ifndef __REVISION_H__
#define __REVISION_H__
 #define _HASH                      "@rev_hash@"
 #define _DATE                      "@rev_date@"
 #define _BRANCH                    "@rev_branch@"
 #define _CMAKE_COMMAND             R"(@CMAKE_COMMAND@)"
 #define _SOURCE_DIRECTORY          R"(@CMAKE_SOURCE_DIR@)"
 #define _BUILD_DIRECTORY           R"(@BUILDDIR@)"
 #define _MYSQL_EXECUTABLE          R"(@MYSQL_EXECUTABLE@)"
 #define _FULL_DATABASE             "JCDB 548.07"
 #define VER_COMPANYNAME_STR        "Noffearr Death ProjecT™ Developers"
 #define VER_LEGALCOPYRIGHT_STR     "(c)2016 DeathCore"
 #define VER_FILEVERSION            0,0,0
 #define VER_FILEVERSION_STR        "@rev_hash@ @rev_date@ (@rev_branch@ branch)"
 #define VER_PRODUCTVERSION         VER_FILEVERSION
 #define VER_PRODUCTVERSION_STR     VER_FILEVERSION_STR
 #define COMPILER_C_FLAGS           "@CMAKE_C_FLAGS@"
 #define COMPILER_CXX_FLAGS         "@CMAKE_CXX_FLAGS@"
#endif // __REVISION_H__