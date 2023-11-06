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
-- Submodules: 66
entity lth2_0CLK_302e9520 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_302e9520;
architecture arch of lth2_0CLK_302e9520 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1832_c6_f5f3]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1832_c1_c3a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1832_c2_d229]
signal n16_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1832_c2_d229]
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c2_d229]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c2_d229]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c2_d229]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c2_d229]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c2_d229]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1832_c2_d229]
signal t16_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1833_c3_1355[uxn_opcodes_h_l1833_c3_1355]
signal printf_uxn_opcodes_h_l1833_c3_1355_uxn_opcodes_h_l1833_c3_1355_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_476f]
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1837_c7_f427]
signal n16_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_f427]
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_f427]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_f427]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_f427]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_f427]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_f427]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1837_c7_f427]
signal t16_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_798b]
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1840_c7_a074]
signal n16_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_a074]
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_a074]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_a074]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_a074]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1840_c7_a074]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_a074]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1840_c7_a074]
signal t16_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_e5b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1845_c7_8fd2]
signal n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_8fd2]
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_8fd2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_8fd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_8fd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_8fd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_8fd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1845_c7_8fd2]
signal t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1846_c3_4af1]
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_e053]
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1849_c7_93ac]
signal n16_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1849_c7_93ac]
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_93ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_93ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_93ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_93ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_93ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_3f34]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1853_c7_88ba]
signal n16_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1853_c7_88ba]
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_88ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_88ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_88ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_88ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c7_88ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1854_c3_19a1]
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1856_c30_f827]
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_return_output : signed(3 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1859_c21_0714]
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1859_c21_459f]
signal MUX_uxn_opcodes_h_l1859_c21_459f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_459f_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_459f_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1859_c21_459f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_5c4c]
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1861_c7_280a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_280a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_280a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_return_output);

-- n16_MUX_uxn_opcodes_h_l1832_c2_d229
n16_MUX_uxn_opcodes_h_l1832_c2_d229 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1832_c2_d229_cond,
n16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue,
n16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse,
n16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_cond,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

-- t16_MUX_uxn_opcodes_h_l1832_c2_d229
t16_MUX_uxn_opcodes_h_l1832_c2_d229 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1832_c2_d229_cond,
t16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue,
t16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse,
t16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

-- printf_uxn_opcodes_h_l1833_c3_1355_uxn_opcodes_h_l1833_c3_1355
printf_uxn_opcodes_h_l1833_c3_1355_uxn_opcodes_h_l1833_c3_1355 : entity work.printf_uxn_opcodes_h_l1833_c3_1355_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1833_c3_1355_uxn_opcodes_h_l1833_c3_1355_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_left,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_right,
BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output);

-- n16_MUX_uxn_opcodes_h_l1837_c7_f427
n16_MUX_uxn_opcodes_h_l1837_c7_f427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1837_c7_f427_cond,
n16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue,
n16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse,
n16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_cond,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output);

-- t16_MUX_uxn_opcodes_h_l1837_c7_f427
t16_MUX_uxn_opcodes_h_l1837_c7_f427 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1837_c7_f427_cond,
t16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue,
t16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse,
t16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_left,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_right,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output);

-- n16_MUX_uxn_opcodes_h_l1840_c7_a074
n16_MUX_uxn_opcodes_h_l1840_c7_a074 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1840_c7_a074_cond,
n16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue,
n16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse,
n16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_cond,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output);

-- t16_MUX_uxn_opcodes_h_l1840_c7_a074
t16_MUX_uxn_opcodes_h_l1840_c7_a074 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1840_c7_a074_cond,
t16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue,
t16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse,
t16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output);

-- n16_MUX_uxn_opcodes_h_l1845_c7_8fd2
n16_MUX_uxn_opcodes_h_l1845_c7_8fd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond,
n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue,
n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse,
n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output);

-- t16_MUX_uxn_opcodes_h_l1845_c7_8fd2
t16_MUX_uxn_opcodes_h_l1845_c7_8fd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond,
t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue,
t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse,
t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1
BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_left,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_right,
BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_left,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_right,
BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output);

-- n16_MUX_uxn_opcodes_h_l1849_c7_93ac
n16_MUX_uxn_opcodes_h_l1849_c7_93ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1849_c7_93ac_cond,
n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue,
n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse,
n16_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output);

-- n16_MUX_uxn_opcodes_h_l1853_c7_88ba
n16_MUX_uxn_opcodes_h_l1853_c7_88ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1853_c7_88ba_cond,
n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue,
n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse,
n16_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1
BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_left,
BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_right,
BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1856_c30_f827
sp_relative_shift_uxn_opcodes_h_l1856_c30_f827 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_ins,
sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_x,
sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_y,
sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714
BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_left,
BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_right,
BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_return_output);

-- MUX_uxn_opcodes_h_l1859_c21_459f
MUX_uxn_opcodes_h_l1859_c21_459f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1859_c21_459f_cond,
MUX_uxn_opcodes_h_l1859_c21_459f_iftrue,
MUX_uxn_opcodes_h_l1859_c21_459f_iffalse,
MUX_uxn_opcodes_h_l1859_c21_459f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_left,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_right,
BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103
CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_return_output,
 n16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
 t16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output,
 n16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output,
 t16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output,
 n16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output,
 t16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output,
 n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output,
 t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output,
 n16_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output,
 n16_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_return_output,
 MUX_uxn_opcodes_h_l1859_c21_459f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_c1b3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1833_c3_1355_uxn_opcodes_h_l1833_c3_1355_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_3aee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_5f9e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_5142 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_fabd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_459f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_459f_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_459f_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1859_c21_459f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1850_l1841_l1846_l1854_DUPLICATE_2594_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1853_l1849_DUPLICATE_3a58_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1867_l1828_DUPLICATE_b206_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_c1b3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1834_c3_c1b3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1859_c21_459f_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_fabd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_fabd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_5142 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1847_c3_5142;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_5f9e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1843_c3_5f9e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_3aee := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1838_c3_3aee;
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_y := resize(to_signed(-3, 3), 4);
     VAR_MUX_uxn_opcodes_h_l1859_c21_459f_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_798b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1845_c11_e5b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1837_c11_476f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c11_3f34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1850_l1841_l1846_l1854_DUPLICATE_2594 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1850_l1841_l1846_l1854_DUPLICATE_2594_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1856_c30_f827] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_ins;
     sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_x;
     sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_return_output := sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1861_c11_5c4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1849_c11_e053] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_left;
     BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output := BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1853_l1849_DUPLICATE_3a58 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1853_l1849_DUPLICATE_3a58_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c6_f5f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c6_f5f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1837_c11_476f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_798b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1845_c11_e5b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1849_c11_e053_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c11_3f34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1861_c11_5c4c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1850_l1841_l1846_l1854_DUPLICATE_2594_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1850_l1841_l1846_l1854_DUPLICATE_2594_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1850_l1841_l1846_l1854_DUPLICATE_2594_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_4f3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1840_l1837_l1861_l1853_l1849_l1845_DUPLICATE_5070_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_985c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1861_l1849_l1845_DUPLICATE_5f1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1853_l1849_DUPLICATE_3a58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1853_l1849_DUPLICATE_3a58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1840_l1837_l1832_l1853_l1849_l1845_DUPLICATE_2641_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1856_c30_f827_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1846_c3_4af1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_left;
     BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_return_output := BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1854_c3_19a1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_left;
     BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_return_output := BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1861_c7_280a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1832_c1_c3a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c7_88ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1861_c7_280a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1861_c7_280a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c7_88ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1846_c3_4af1_return_output;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1854_c3_19a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1851_l1842_DUPLICATE_a103_return_output;
     VAR_printf_uxn_opcodes_h_l1833_c3_1355_uxn_opcodes_h_l1833_c3_1355_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1832_c1_c3a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1861_c7_280a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1861_c7_280a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1861_c7_280a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;
     -- printf_uxn_opcodes_h_l1833_c3_1355[uxn_opcodes_h_l1833_c3_1355] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1833_c3_1355_uxn_opcodes_h_l1833_c3_1355_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1833_c3_1355_uxn_opcodes_h_l1833_c3_1355_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_LT[uxn_opcodes_h_l1859_c21_0714] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_left;
     BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_return_output := BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c7_88ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;

     -- n16_MUX[uxn_opcodes_h_l1853_c7_88ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1853_c7_88ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_cond;
     n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue;
     n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output := n16_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c7_88ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1849_c7_93ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;

     -- t16_MUX[uxn_opcodes_h_l1845_c7_8fd2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond;
     t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue;
     t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output := t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c7_88ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1849_c7_93ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1859_c21_459f_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1859_c21_0714_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;
     -- t16_MUX[uxn_opcodes_h_l1840_c7_a074] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1840_c7_a074_cond <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_cond;
     t16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue;
     t16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output := t16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;

     -- n16_MUX[uxn_opcodes_h_l1849_c7_93ac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1849_c7_93ac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_cond;
     n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue;
     n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output := n16_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1845_c7_8fd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1849_c7_93ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1849_c7_93ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1845_c7_8fd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1849_c7_93ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;

     -- MUX[uxn_opcodes_h_l1859_c21_459f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1859_c21_459f_cond <= VAR_MUX_uxn_opcodes_h_l1859_c21_459f_cond;
     MUX_uxn_opcodes_h_l1859_c21_459f_iftrue <= VAR_MUX_uxn_opcodes_h_l1859_c21_459f_iftrue;
     MUX_uxn_opcodes_h_l1859_c21_459f_iffalse <= VAR_MUX_uxn_opcodes_h_l1859_c21_459f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1859_c21_459f_return_output := MUX_uxn_opcodes_h_l1859_c21_459f_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue := VAR_MUX_uxn_opcodes_h_l1859_c21_459f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1853_c7_88ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1845_c7_8fd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1837_c7_f427] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1837_c7_f427_cond <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_cond;
     t16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue;
     t16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output := t16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1845_c7_8fd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1840_c7_a074] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;

     -- n16_MUX[uxn_opcodes_h_l1845_c7_8fd2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond;
     n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue;
     n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output := n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1845_c7_8fd2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1840_c7_a074] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1853_c7_88ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1840_c7_a074] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;

     -- t16_MUX[uxn_opcodes_h_l1832_c2_d229] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1832_c2_d229_cond <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_cond;
     t16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue;
     t16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output := t16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1837_c7_f427] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_a074] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1837_c7_f427] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1849_c7_93ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_a074] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;

     -- n16_MUX[uxn_opcodes_h_l1840_c7_a074] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1840_c7_a074_cond <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_cond;
     n16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue;
     n16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output := n16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1849_c7_93ac_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1837_c7_f427] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;

     -- n16_MUX[uxn_opcodes_h_l1837_c7_f427] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1837_c7_f427_cond <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_cond;
     n16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue;
     n16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output := n16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1832_c2_d229] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1837_c7_f427] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1837_c7_f427] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1845_c7_8fd2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1832_c2_d229] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1845_c7_8fd2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c2_d229] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c2_d229] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1832_c2_d229] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1840_c7_a074] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_return_output := result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;

     -- n16_MUX[uxn_opcodes_h_l1832_c2_d229] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1832_c2_d229_cond <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_cond;
     n16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue;
     n16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output := n16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1840_c7_a074_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1837_c7_f427] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_return_output := result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1837_c7_f427_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1832_c2_d229] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_return_output := result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1867_l1828_DUPLICATE_b206 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1867_l1828_DUPLICATE_b206_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1832_c2_d229_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1832_c2_d229_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1867_l1828_DUPLICATE_b206_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l1867_l1828_DUPLICATE_b206_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
