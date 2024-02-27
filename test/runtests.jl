# 测试文件

import Pkg
Pkg.activate("./")
Pkg.upgrade_manifest()
Pkg.resolve()
Pkg.update()



using FastGaussQuadrature
using BenchmarkTools