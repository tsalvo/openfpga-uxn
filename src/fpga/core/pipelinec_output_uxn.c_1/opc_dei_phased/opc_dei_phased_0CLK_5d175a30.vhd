-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 67
entity opc_dei_phased_0CLK_5d175a30 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 pc : in unsigned(15 downto 0);
 sp : in unsigned(7 downto 0);
 stack_index : in unsigned(0 downto 0);
 ins : in unsigned(7 downto 0);
 k : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end opc_dei_phased_0CLK_5d175a30;
architecture arch of opc_dei_phased_0CLK_5d175a30 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_phased_h_l864_c6_2cf6]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l864_c1_5ae8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l867_c7_e4fd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l864_c2_29de]
signal t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l864_c2_29de]
signal result_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output : unsigned(0 downto 0);

-- set_will_fail[uxn_opcodes_phased_h_l865_c12_e787]
signal set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_sp : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_k : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_mul : unsigned(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_add : signed(7 downto 0);
signal set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l867_c11_6afc]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l867_c1_5b03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l870_c7_31b2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l867_c7_e4fd]
signal t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l867_c7_e4fd]
signal result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l868_c8_6579]
signal t_register_uxn_opcodes_phased_h_l868_c8_6579_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l868_c8_6579_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l870_c11_367d]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l870_c1_e38f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l873_c7_a2c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_phased_h_l870_c7_31b2]
signal t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l870_c7_31b2]
signal result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output : unsigned(0 downto 0);

-- t_register[uxn_opcodes_phased_h_l871_c8_2af5]
signal t_register_uxn_opcodes_phased_h_l871_c8_2af5_CLOCK_ENABLE : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_index : unsigned(0 downto 0);
signal t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_ptr : unsigned(7 downto 0);
signal t_register_uxn_opcodes_phased_h_l871_c8_2af5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l873_c11_7857]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l873_c1_83fe]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l876_c7_1c56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l873_c7_a2c6]
signal result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output : unsigned(0 downto 0);

-- set[uxn_opcodes_phased_h_l874_c3_2164]
signal set_uxn_opcodes_phased_h_l874_c3_2164_CLOCK_ENABLE : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l874_c3_2164_sp : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l874_c3_2164_stack_index : unsigned(0 downto 0);
signal set_uxn_opcodes_phased_h_l874_c3_2164_ins : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l874_c3_2164_k : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l874_c3_2164_mul : unsigned(7 downto 0);
signal set_uxn_opcodes_phased_h_l874_c3_2164_add : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l876_c11_141a]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l876_c1_5c22]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l879_c7_cad2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l876_c7_1c56]
signal result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l877_c12_3480]
signal dei_phased_uxn_opcodes_phased_h_l877_c12_3480_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l877_c12_3480_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l877_c12_3480_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l877_c12_3480_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l877_c12_3480_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l879_c11_f2e1]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l879_c1_59e0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l882_c7_072f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l879_c7_cad2]
signal result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l880_c12_680d]
signal dei_phased_uxn_opcodes_phased_h_l880_c12_680d_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l880_c12_680d_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l880_c12_680d_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l880_c12_680d_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l880_c12_680d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l882_c11_f574]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l882_c1_9755]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l885_c7_4e58]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l882_c7_072f]
signal result_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l883_c12_2506]
signal dei_phased_uxn_opcodes_phased_h_l883_c12_2506_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l883_c12_2506_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l883_c12_2506_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l883_c12_2506_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l883_c12_2506_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l885_c11_f10a]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l885_c1_4d20]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l888_c7_6a60]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l885_c7_4e58]
signal result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l886_c12_13bf]
signal dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l888_c11_4295]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l888_c1_9ce4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l891_c7_4a57]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l888_c7_6a60]
signal result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l889_c12_429f]
signal dei_phased_uxn_opcodes_phased_h_l889_c12_429f_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l889_c12_429f_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l889_c12_429f_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l889_c12_429f_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l889_c12_429f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l891_c11_b5f6]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l891_c1_9ec2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l894_c7_08ab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l891_c7_4a57]
signal result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l892_c12_9899]
signal dei_phased_uxn_opcodes_phased_h_l892_c12_9899_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l892_c12_9899_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l892_c12_9899_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l892_c12_9899_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l892_c12_9899_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l894_c11_4dd5]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l894_c1_2f83]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l897_c7_4afd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l894_c7_08ab]
signal result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l895_c12_f360]
signal dei_phased_uxn_opcodes_phased_h_l895_c12_f360_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l895_c12_f360_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l895_c12_f360_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l895_c12_f360_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l895_c12_f360_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l897_c11_e389]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l897_c1_2c1f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l900_c7_67c6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l897_c7_4afd]
signal result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l898_c12_eb23]
signal dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_phased_h_l900_c11_ff5b]
signal BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l900_c1_7a66]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_opcodes_phased_h_l900_c7_67c6]
signal result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output : unsigned(0 downto 0);

-- dei_phased[uxn_opcodes_phased_h_l901_c12_8244]
signal dei_phased_uxn_opcodes_phased_h_l901_c12_8244_CLOCK_ENABLE : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l901_c12_8244_phase : unsigned(2 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l901_c12_8244_sp : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_index : unsigned(0 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_offset : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l901_c12_8244_addr : unsigned(7 downto 0);
signal dei_phased_uxn_opcodes_phased_h_l901_c12_8244_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6
BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l864_c2_29de
t8_MUX_uxn_opcodes_phased_h_l864_c2_29de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond,
t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue,
t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse,
t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output);

-- result_MUX_uxn_opcodes_phased_h_l864_c2_29de
result_MUX_uxn_opcodes_phased_h_l864_c2_29de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond,
result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue,
result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse,
result_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output);

-- set_will_fail_uxn_opcodes_phased_h_l865_c12_e787
set_will_fail_uxn_opcodes_phased_h_l865_c12_e787 : entity work.set_will_fail_0CLK_23eb2db7 port map (
clk,
set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_CLOCK_ENABLE,
set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_sp,
set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_k,
set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_mul,
set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_add,
set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc
BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd
t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond,
t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue,
t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse,
t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output);

-- result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd
result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond,
result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue,
result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse,
result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output);

-- t_register_uxn_opcodes_phased_h_l868_c8_6579
t_register_uxn_opcodes_phased_h_l868_c8_6579 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l868_c8_6579_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_index,
t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_ptr,
t_register_uxn_opcodes_phased_h_l868_c8_6579_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d
BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output);

-- t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2
t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond,
t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue,
t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse,
t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output);

-- result_MUX_uxn_opcodes_phased_h_l870_c7_31b2
result_MUX_uxn_opcodes_phased_h_l870_c7_31b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond,
result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue,
result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse,
result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output);

-- t_register_uxn_opcodes_phased_h_l871_c8_2af5
t_register_uxn_opcodes_phased_h_l871_c8_2af5 : entity work.t_register_0CLK_621d5f60 port map (
clk,
t_register_uxn_opcodes_phased_h_l871_c8_2af5_CLOCK_ENABLE,
t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_index,
t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_ptr,
t_register_uxn_opcodes_phased_h_l871_c8_2af5_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857
BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output);

-- result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6
result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond,
result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue,
result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse,
result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output);

-- set_uxn_opcodes_phased_h_l874_c3_2164
set_uxn_opcodes_phased_h_l874_c3_2164 : entity work.set_0CLK_6f2c5aad port map (
clk,
set_uxn_opcodes_phased_h_l874_c3_2164_CLOCK_ENABLE,
set_uxn_opcodes_phased_h_l874_c3_2164_sp,
set_uxn_opcodes_phased_h_l874_c3_2164_stack_index,
set_uxn_opcodes_phased_h_l874_c3_2164_ins,
set_uxn_opcodes_phased_h_l874_c3_2164_k,
set_uxn_opcodes_phased_h_l874_c3_2164_mul,
set_uxn_opcodes_phased_h_l874_c3_2164_add);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a
BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output);

-- result_MUX_uxn_opcodes_phased_h_l876_c7_1c56
result_MUX_uxn_opcodes_phased_h_l876_c7_1c56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond,
result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue,
result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse,
result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output);

-- dei_phased_uxn_opcodes_phased_h_l877_c12_3480
dei_phased_uxn_opcodes_phased_h_l877_c12_3480 : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l877_c12_3480_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l877_c12_3480_phase,
dei_phased_uxn_opcodes_phased_h_l877_c12_3480_sp,
dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_index,
dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_offset,
dei_phased_uxn_opcodes_phased_h_l877_c12_3480_addr,
dei_phased_uxn_opcodes_phased_h_l877_c12_3480_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1
BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output);

-- result_MUX_uxn_opcodes_phased_h_l879_c7_cad2
result_MUX_uxn_opcodes_phased_h_l879_c7_cad2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond,
result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue,
result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse,
result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output);

-- dei_phased_uxn_opcodes_phased_h_l880_c12_680d
dei_phased_uxn_opcodes_phased_h_l880_c12_680d : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l880_c12_680d_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l880_c12_680d_phase,
dei_phased_uxn_opcodes_phased_h_l880_c12_680d_sp,
dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_index,
dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_offset,
dei_phased_uxn_opcodes_phased_h_l880_c12_680d_addr,
dei_phased_uxn_opcodes_phased_h_l880_c12_680d_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574
BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574 : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output);

-- result_MUX_uxn_opcodes_phased_h_l882_c7_072f
result_MUX_uxn_opcodes_phased_h_l882_c7_072f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond,
result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue,
result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse,
result_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output);

-- dei_phased_uxn_opcodes_phased_h_l883_c12_2506
dei_phased_uxn_opcodes_phased_h_l883_c12_2506 : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l883_c12_2506_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l883_c12_2506_phase,
dei_phased_uxn_opcodes_phased_h_l883_c12_2506_sp,
dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_index,
dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_offset,
dei_phased_uxn_opcodes_phased_h_l883_c12_2506_addr,
dei_phased_uxn_opcodes_phased_h_l883_c12_2506_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a
BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a : entity work.BIN_OP_EQ_uint4_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output);

-- result_MUX_uxn_opcodes_phased_h_l885_c7_4e58
result_MUX_uxn_opcodes_phased_h_l885_c7_4e58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond,
result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue,
result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse,
result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output);

-- dei_phased_uxn_opcodes_phased_h_l886_c12_13bf
dei_phased_uxn_opcodes_phased_h_l886_c12_13bf : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_phase,
dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_sp,
dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_index,
dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_offset,
dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_addr,
dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295
BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output);

-- result_MUX_uxn_opcodes_phased_h_l888_c7_6a60
result_MUX_uxn_opcodes_phased_h_l888_c7_6a60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond,
result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue,
result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse,
result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output);

-- dei_phased_uxn_opcodes_phased_h_l889_c12_429f
dei_phased_uxn_opcodes_phased_h_l889_c12_429f : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l889_c12_429f_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l889_c12_429f_phase,
dei_phased_uxn_opcodes_phased_h_l889_c12_429f_sp,
dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_index,
dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_offset,
dei_phased_uxn_opcodes_phased_h_l889_c12_429f_addr,
dei_phased_uxn_opcodes_phased_h_l889_c12_429f_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6
BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output);

-- result_MUX_uxn_opcodes_phased_h_l891_c7_4a57
result_MUX_uxn_opcodes_phased_h_l891_c7_4a57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond,
result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue,
result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse,
result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output);

-- dei_phased_uxn_opcodes_phased_h_l892_c12_9899
dei_phased_uxn_opcodes_phased_h_l892_c12_9899 : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l892_c12_9899_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l892_c12_9899_phase,
dei_phased_uxn_opcodes_phased_h_l892_c12_9899_sp,
dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_index,
dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_offset,
dei_phased_uxn_opcodes_phased_h_l892_c12_9899_addr,
dei_phased_uxn_opcodes_phased_h_l892_c12_9899_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5
BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output);

-- result_MUX_uxn_opcodes_phased_h_l894_c7_08ab
result_MUX_uxn_opcodes_phased_h_l894_c7_08ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond,
result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue,
result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse,
result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output);

-- dei_phased_uxn_opcodes_phased_h_l895_c12_f360
dei_phased_uxn_opcodes_phased_h_l895_c12_f360 : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l895_c12_f360_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l895_c12_f360_phase,
dei_phased_uxn_opcodes_phased_h_l895_c12_f360_sp,
dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_index,
dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_offset,
dei_phased_uxn_opcodes_phased_h_l895_c12_f360_addr,
dei_phased_uxn_opcodes_phased_h_l895_c12_f360_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389
BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output);

-- result_MUX_uxn_opcodes_phased_h_l897_c7_4afd
result_MUX_uxn_opcodes_phased_h_l897_c7_4afd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond,
result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue,
result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse,
result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output);

-- dei_phased_uxn_opcodes_phased_h_l898_c12_eb23
dei_phased_uxn_opcodes_phased_h_l898_c12_eb23 : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_phase,
dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_sp,
dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_index,
dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_offset,
dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_addr,
dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_return_output);

-- BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b
BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_left,
BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_right,
BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_return_output);

-- result_MUX_uxn_opcodes_phased_h_l900_c7_67c6
result_MUX_uxn_opcodes_phased_h_l900_c7_67c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond,
result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue,
result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse,
result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output);

-- dei_phased_uxn_opcodes_phased_h_l901_c12_8244
dei_phased_uxn_opcodes_phased_h_l901_c12_8244 : entity work.dei_phased_0CLK_39f0c79a port map (
clk,
dei_phased_uxn_opcodes_phased_h_l901_c12_8244_CLOCK_ENABLE,
dei_phased_uxn_opcodes_phased_h_l901_c12_8244_phase,
dei_phased_uxn_opcodes_phased_h_l901_c12_8244_sp,
dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_index,
dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_offset,
dei_phased_uxn_opcodes_phased_h_l901_c12_8244_addr,
dei_phased_uxn_opcodes_phased_h_l901_c12_8244_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 sp,
 stack_index,
 ins,
 k,
 -- Registers
 t8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output,
 t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output,
 result_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output,
 set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output,
 t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output,
 result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output,
 t_register_uxn_opcodes_phased_h_l868_c8_6579_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output,
 t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output,
 result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output,
 t_register_uxn_opcodes_phased_h_l871_c8_2af5_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output,
 result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output,
 result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output,
 dei_phased_uxn_opcodes_phased_h_l877_c12_3480_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output,
 result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output,
 dei_phased_uxn_opcodes_phased_h_l880_c12_680d_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output,
 result_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output,
 dei_phased_uxn_opcodes_phased_h_l883_c12_2506_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output,
 result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output,
 dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output,
 result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output,
 dei_phased_uxn_opcodes_phased_h_l889_c12_429f_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output,
 result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output,
 dei_phased_uxn_opcodes_phased_h_l892_c12_9899_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output,
 result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output,
 dei_phased_uxn_opcodes_phased_h_l895_c12_f360_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output,
 result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output,
 dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_return_output,
 BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_return_output,
 result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output,
 dei_phased_uxn_opcodes_phased_h_l901_c12_8244_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_sp : unsigned(7 downto 0);
 variable VAR_stack_index : unsigned(0 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_k : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_sp : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_k : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_mul : unsigned(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_add : signed(7 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_index : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_ptr : unsigned(7 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l874_c3_2164_sp : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l874_c3_2164_stack_index : unsigned(0 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l874_c3_2164_ins : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l874_c3_2164_k : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l874_c3_2164_mul : unsigned(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l874_c3_2164_add : signed(7 downto 0);
 variable VAR_set_uxn_opcodes_phased_h_l874_c3_2164_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_phase : unsigned(2 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_sp : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_index : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_offset : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_addr : unsigned(7 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_right := to_unsigned(8, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iffalse := to_unsigned(0, 1);
     VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_phase := resize(to_unsigned(8, 4), 3);
     VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_phase := resize(to_unsigned(1, 1), 3);
     VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_phase := resize(to_unsigned(3, 2), 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_right := to_unsigned(4, 3);
     VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_phase := to_unsigned(7, 3);
     VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_right := to_unsigned(9, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_right := to_unsigned(10, 4);
     VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_set_uxn_opcodes_phased_h_l874_c3_2164_mul := resize(to_unsigned(1, 1), 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iffalse := to_unsigned(0, 1);
     VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_phase := to_unsigned(6, 3);
     VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_mul := resize(to_unsigned(1, 1), 8);
     VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_phase := resize(to_unsigned(2, 2), 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_right := to_unsigned(12, 4);
     VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iffalse := to_unsigned(0, 1);
     VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_phase := resize(to_unsigned(0, 1), 3);
     VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue := to_unsigned(0, 1);
     VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_set_uxn_opcodes_phased_h_l874_c3_2164_add := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_right := to_unsigned(3, 2);
     VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_offset := resize(to_unsigned(0, 1), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_right := to_unsigned(7, 3);
     VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_phase := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_right := to_unsigned(11, 4);
     VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_phase := to_unsigned(4, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_sp := sp;
     VAR_stack_index := stack_index;
     VAR_ins := ins;
     VAR_k := k;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse := VAR_CLOCK_ENABLE;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iftrue := VAR_CLOCK_ENABLE;
     VAR_set_uxn_opcodes_phased_h_l874_c3_2164_ins := VAR_ins;
     VAR_set_uxn_opcodes_phased_h_l874_c3_2164_k := VAR_k;
     VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_k := VAR_k;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_left := VAR_phase;
     VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue := result;
     VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse := result;
     VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_sp := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_sp := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_sp := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_sp := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_sp := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_sp := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_sp := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_sp := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_sp := VAR_sp;
     VAR_set_uxn_opcodes_phased_h_l874_c3_2164_sp := VAR_sp;
     VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_sp := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_ptr := VAR_sp;
     VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_ptr := VAR_sp;
     VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_index := VAR_stack_index;
     VAR_set_uxn_opcodes_phased_h_l874_c3_2164_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_index := VAR_stack_index;
     VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_index := VAR_stack_index;
     VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_addr := t8;
     VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_addr := t8;
     VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_addr := t8;
     VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_addr := t8;
     VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_addr := t8;
     VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_addr := t8;
     VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_addr := t8;
     VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_addr := t8;
     VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_addr := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_phased_h_l897_c11_e389] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l873_c11_7857] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l879_c11_f2e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l867_c11_6afc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l864_c6_2cf6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l885_c11_f10a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l870_c11_367d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l882_c11_f574] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l891_c11_b5f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l876_c11_141a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l894_c11_4dd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l900_c11_ff5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_phased_h_l888_c11_4295] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_left <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_left;
     BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_right <= VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output := BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output;

     -- Submodule level 1
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l864_c6_2cf6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l867_c11_6afc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l870_c11_367d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l873_c11_7857_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l876_c11_141a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l879_c11_f2e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l882_c11_f574_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l885_c11_f10a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l888_c11_4295_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l891_c11_b5f6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l894_c11_4dd5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l897_c11_e389_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_phased_h_l900_c11_ff5b_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l867_c7_e4fd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l864_c1_5ae8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output;
     VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l864_c1_5ae8_return_output;
     -- set_will_fail[uxn_opcodes_phased_h_l865_c12_e787] LATENCY=0
     -- Clock enable
     set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_CLOCK_ENABLE <= VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_CLOCK_ENABLE;
     -- Inputs
     set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_sp <= VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_sp;
     set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_k <= VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_k;
     set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_mul <= VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_mul;
     set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_add <= VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_add;
     -- Outputs
     VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_return_output := set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l870_c7_31b2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l867_c1_5b03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_return_output;

     -- Submodule level 3
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l867_c1_5b03_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue := VAR_set_will_fail_uxn_opcodes_phased_h_l865_c12_e787_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l870_c1_e38f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_return_output;

     -- t_register[uxn_opcodes_phased_h_l868_c8_6579] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l868_c8_6579_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_index;
     t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_return_output := t_register_uxn_opcodes_phased_h_l868_c8_6579_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l873_c7_a2c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output;
     VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l870_c1_e38f_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue := VAR_t_register_uxn_opcodes_phased_h_l868_c8_6579_return_output;
     -- t_register[uxn_opcodes_phased_h_l871_c8_2af5] LATENCY=0
     -- Clock enable
     t_register_uxn_opcodes_phased_h_l871_c8_2af5_CLOCK_ENABLE <= VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_CLOCK_ENABLE;
     -- Inputs
     t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_index <= VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_index;
     t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_ptr <= VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_stack_ptr;
     -- Outputs
     VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_return_output := t_register_uxn_opcodes_phased_h_l871_c8_2af5_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l876_c7_1c56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l873_c1_83fe] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output;
     VAR_set_uxn_opcodes_phased_h_l874_c3_2164_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l873_c1_83fe_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue := VAR_t_register_uxn_opcodes_phased_h_l871_c8_2af5_return_output;
     -- set[uxn_opcodes_phased_h_l874_c3_2164] LATENCY=0
     -- Clock enable
     set_uxn_opcodes_phased_h_l874_c3_2164_CLOCK_ENABLE <= VAR_set_uxn_opcodes_phased_h_l874_c3_2164_CLOCK_ENABLE;
     -- Inputs
     set_uxn_opcodes_phased_h_l874_c3_2164_sp <= VAR_set_uxn_opcodes_phased_h_l874_c3_2164_sp;
     set_uxn_opcodes_phased_h_l874_c3_2164_stack_index <= VAR_set_uxn_opcodes_phased_h_l874_c3_2164_stack_index;
     set_uxn_opcodes_phased_h_l874_c3_2164_ins <= VAR_set_uxn_opcodes_phased_h_l874_c3_2164_ins;
     set_uxn_opcodes_phased_h_l874_c3_2164_k <= VAR_set_uxn_opcodes_phased_h_l874_c3_2164_k;
     set_uxn_opcodes_phased_h_l874_c3_2164_mul <= VAR_set_uxn_opcodes_phased_h_l874_c3_2164_mul;
     set_uxn_opcodes_phased_h_l874_c3_2164_add <= VAR_set_uxn_opcodes_phased_h_l874_c3_2164_add;
     -- Outputs

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l879_c7_cad2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l876_c1_5c22] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l870_c7_31b2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond;
     t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output := t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output;
     VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l876_c1_5c22_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l882_c7_072f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output;

     -- dei_phased[uxn_opcodes_phased_h_l877_c12_3480] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l877_c12_3480_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l877_c12_3480_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_phase;
     dei_phased_uxn_opcodes_phased_h_l877_c12_3480_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_sp;
     dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_index;
     dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l877_c12_3480_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_return_output := dei_phased_uxn_opcodes_phased_h_l877_c12_3480_return_output;

     -- t8_MUX[uxn_opcodes_phased_h_l867_c7_e4fd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond;
     t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output := t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l879_c1_59e0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output;
     VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l879_c1_59e0_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l877_c12_3480_return_output;
     VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse := VAR_t8_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output;
     -- t8_MUX[uxn_opcodes_phased_h_l864_c2_29de] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond <= VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond;
     t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue <= VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue;
     t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse <= VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output := t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l882_c1_9755] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_return_output;

     -- dei_phased[uxn_opcodes_phased_h_l880_c12_680d] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l880_c12_680d_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l880_c12_680d_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_phase;
     dei_phased_uxn_opcodes_phased_h_l880_c12_680d_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_sp;
     dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_index;
     dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l880_c12_680d_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_return_output := dei_phased_uxn_opcodes_phased_h_l880_c12_680d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l885_c7_4e58] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output;
     VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l882_c1_9755_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l880_c12_680d_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l888_c7_6a60] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l885_c1_4d20] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_return_output;

     -- dei_phased[uxn_opcodes_phased_h_l883_c12_2506] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l883_c12_2506_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l883_c12_2506_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_phase;
     dei_phased_uxn_opcodes_phased_h_l883_c12_2506_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_sp;
     dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_index;
     dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l883_c12_2506_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_return_output := dei_phased_uxn_opcodes_phased_h_l883_c12_2506_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output;
     VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l885_c1_4d20_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l883_c12_2506_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l888_c1_9ce4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_return_output;

     -- dei_phased[uxn_opcodes_phased_h_l886_c12_13bf] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_phase;
     dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_sp;
     dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_index;
     dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_return_output := dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l891_c7_4a57] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output;
     VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l888_c1_9ce4_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l886_c12_13bf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l894_c7_08ab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output;

     -- dei_phased[uxn_opcodes_phased_h_l889_c12_429f] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l889_c12_429f_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l889_c12_429f_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_phase;
     dei_phased_uxn_opcodes_phased_h_l889_c12_429f_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_sp;
     dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_index;
     dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l889_c12_429f_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_return_output := dei_phased_uxn_opcodes_phased_h_l889_c12_429f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l891_c1_9ec2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output;
     VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l891_c1_9ec2_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l889_c12_429f_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l894_c1_2f83] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_return_output;

     -- dei_phased[uxn_opcodes_phased_h_l892_c12_9899] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l892_c12_9899_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l892_c12_9899_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_phase;
     dei_phased_uxn_opcodes_phased_h_l892_c12_9899_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_sp;
     dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_index;
     dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l892_c12_9899_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_return_output := dei_phased_uxn_opcodes_phased_h_l892_c12_9899_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l897_c7_4afd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output;
     VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l894_c1_2f83_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l892_c12_9899_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l900_c7_67c6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l897_c1_2c1f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_return_output;

     -- dei_phased[uxn_opcodes_phased_h_l895_c12_f360] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l895_c12_f360_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l895_c12_f360_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_phase;
     dei_phased_uxn_opcodes_phased_h_l895_c12_f360_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_sp;
     dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_index;
     dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l895_c12_f360_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_return_output := dei_phased_uxn_opcodes_phased_h_l895_c12_f360_return_output;

     -- Submodule level 13
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output;
     VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l897_c1_2c1f_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l895_c12_f360_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_phased_h_l900_c1_7a66] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_return_output;

     -- dei_phased[uxn_opcodes_phased_h_l898_c12_eb23] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_phase;
     dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_sp;
     dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_index;
     dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_return_output := dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_return_output;

     -- Submodule level 14
     VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_phased_h_l900_c1_7a66_return_output;
     VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l898_c12_eb23_return_output;
     -- dei_phased[uxn_opcodes_phased_h_l901_c12_8244] LATENCY=0
     -- Clock enable
     dei_phased_uxn_opcodes_phased_h_l901_c12_8244_CLOCK_ENABLE <= VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_CLOCK_ENABLE;
     -- Inputs
     dei_phased_uxn_opcodes_phased_h_l901_c12_8244_phase <= VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_phase;
     dei_phased_uxn_opcodes_phased_h_l901_c12_8244_sp <= VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_sp;
     dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_index <= VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_index;
     dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_offset <= VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_stack_offset;
     dei_phased_uxn_opcodes_phased_h_l901_c12_8244_addr <= VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_addr;
     -- Outputs
     VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_return_output := dei_phased_uxn_opcodes_phased_h_l901_c12_8244_return_output;

     -- Submodule level 15
     VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue := VAR_dei_phased_uxn_opcodes_phased_h_l901_c12_8244_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l900_c7_67c6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_cond;
     result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iftrue;
     result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output := result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output;

     -- Submodule level 16
     VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l900_c7_67c6_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l897_c7_4afd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_cond;
     result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iftrue;
     result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output := result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output;

     -- Submodule level 17
     VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l897_c7_4afd_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l894_c7_08ab] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_cond;
     result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iftrue;
     result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output := result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output;

     -- Submodule level 18
     VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l894_c7_08ab_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l891_c7_4a57] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_cond;
     result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iftrue;
     result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output := result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output;

     -- Submodule level 19
     VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l891_c7_4a57_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l888_c7_6a60] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_cond;
     result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iftrue;
     result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output := result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output;

     -- Submodule level 20
     VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l888_c7_6a60_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l885_c7_4e58] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_cond;
     result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iftrue;
     result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output := result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output;

     -- Submodule level 21
     VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l885_c7_4e58_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l882_c7_072f] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_cond;
     result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iftrue;
     result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output := result_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output;

     -- Submodule level 22
     VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l882_c7_072f_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l879_c7_cad2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_cond;
     result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iftrue;
     result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output := result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output;

     -- Submodule level 23
     VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l879_c7_cad2_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l876_c7_1c56] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_cond;
     result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iftrue;
     result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output := result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output;

     -- Submodule level 24
     VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l876_c7_1c56_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l873_c7_a2c6] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_cond;
     result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iftrue;
     result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output := result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output;

     -- Submodule level 25
     VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l873_c7_a2c6_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l870_c7_31b2] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_cond;
     result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iftrue;
     result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output := result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output;

     -- Submodule level 26
     VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l870_c7_31b2_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l867_c7_e4fd] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_cond;
     result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iftrue;
     result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output := result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output;

     -- Submodule level 27
     VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse := VAR_result_MUX_uxn_opcodes_phased_h_l867_c7_e4fd_return_output;
     -- result_MUX[uxn_opcodes_phased_h_l864_c2_29de] LATENCY=0
     -- Inputs
     result_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond <= VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_cond;
     result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue <= VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iftrue;
     result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse <= VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output := result_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output;

     -- Submodule level 28
     REG_VAR_result := VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output;
     VAR_return_output := VAR_result_MUX_uxn_opcodes_phased_h_l864_c2_29de_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
