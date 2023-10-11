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
-- Submodules: 59
entity ora_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora_0CLK_3220bbf1;
architecture arch of ora_0CLK_3220bbf1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1055_c6_b8df]
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_f1e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1055_c2_a839]
signal t8_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c2_a839]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c2_a839]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c2_a839]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c2_a839]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1055_c2_a839]
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c2_a839]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1055_c2_a839]
signal n8_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1056_c3_fb9d[uxn_opcodes_h_l1056_c3_fb9d]
signal printf_uxn_opcodes_h_l1056_c3_fb9d_uxn_opcodes_h_l1056_c3_fb9d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_55b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1060_c7_3ce1]
signal t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c7_3ce1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1060_c7_3ce1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1060_c7_3ce1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c7_3ce1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1060_c7_3ce1]
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1060_c7_3ce1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1060_c7_3ce1]
signal n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_b0b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1063_c7_0d97]
signal t8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_0d97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_0d97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_0d97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_0d97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1063_c7_0d97]
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c7_0d97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1063_c7_0d97]
signal n8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_c32f]
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_0794]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_0794]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_0794]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_0794]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1067_c7_0794]
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c7_0794]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1067_c7_0794]
signal n8_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1070_c11_3239]
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1070_c7_177c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1070_c7_177c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1070_c7_177c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1070_c7_177c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1070_c7_177c]
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1070_c7_177c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1070_c7_177c]
signal n8_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1073_c32_700a]
signal BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1073_c32_e2df]
signal BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1073_c32_5270]
signal MUX_uxn_opcodes_h_l1073_c32_5270_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1073_c32_5270_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1073_c32_5270_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1073_c32_5270_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_afc9]
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_f203]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_f203]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_f203]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_f203]
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_f203]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1079_c24_74fd]
signal BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_a793]
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_aef6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_aef6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df
BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_left,
BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_right,
BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_return_output);

-- t8_MUX_uxn_opcodes_h_l1055_c2_a839
t8_MUX_uxn_opcodes_h_l1055_c2_a839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1055_c2_a839_cond,
t8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue,
t8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse,
t8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839
result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_cond,
result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

-- n8_MUX_uxn_opcodes_h_l1055_c2_a839
n8_MUX_uxn_opcodes_h_l1055_c2_a839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1055_c2_a839_cond,
n8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue,
n8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse,
n8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

-- printf_uxn_opcodes_h_l1056_c3_fb9d_uxn_opcodes_h_l1056_c3_fb9d
printf_uxn_opcodes_h_l1056_c3_fb9d_uxn_opcodes_h_l1056_c3_fb9d : entity work.printf_uxn_opcodes_h_l1056_c3_fb9d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1056_c3_fb9d_uxn_opcodes_h_l1056_c3_fb9d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output);

-- t8_MUX_uxn_opcodes_h_l1060_c7_3ce1
t8_MUX_uxn_opcodes_h_l1060_c7_3ce1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond,
t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue,
t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse,
t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output);

-- n8_MUX_uxn_opcodes_h_l1060_c7_3ce1
n8_MUX_uxn_opcodes_h_l1060_c7_3ce1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond,
n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue,
n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse,
n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output);

-- t8_MUX_uxn_opcodes_h_l1063_c7_0d97
t8_MUX_uxn_opcodes_h_l1063_c7_0d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond,
t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue,
t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse,
t8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_cond,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output);

-- n8_MUX_uxn_opcodes_h_l1063_c7_0d97
n8_MUX_uxn_opcodes_h_l1063_c7_0d97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond,
n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue,
n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse,
n8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_left,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_right,
BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_cond,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output);

-- n8_MUX_uxn_opcodes_h_l1067_c7_0794
n8_MUX_uxn_opcodes_h_l1067_c7_0794 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1067_c7_0794_cond,
n8_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue,
n8_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse,
n8_MUX_uxn_opcodes_h_l1067_c7_0794_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_left,
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_right,
BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output);

-- n8_MUX_uxn_opcodes_h_l1070_c7_177c
n8_MUX_uxn_opcodes_h_l1070_c7_177c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1070_c7_177c_cond,
n8_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue,
n8_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse,
n8_MUX_uxn_opcodes_h_l1070_c7_177c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a
BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_left,
BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_right,
BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df
BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_left,
BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_right,
BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_return_output);

-- MUX_uxn_opcodes_h_l1073_c32_5270
MUX_uxn_opcodes_h_l1073_c32_5270 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1073_c32_5270_cond,
MUX_uxn_opcodes_h_l1073_c32_5270_iftrue,
MUX_uxn_opcodes_h_l1073_c32_5270_iffalse,
MUX_uxn_opcodes_h_l1073_c32_5270_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_left,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_right,
BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_cond,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd
BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_left,
BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_right,
BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_left,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_right,
BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_return_output,
 t8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
 n8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output,
 t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output,
 n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output,
 t8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output,
 n8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output,
 n8_MUX_uxn_opcodes_h_l1067_c7_0794_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output,
 n8_MUX_uxn_opcodes_h_l1070_c7_177c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_return_output,
 MUX_uxn_opcodes_h_l1073_c32_5270_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_a94b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1056_c3_fb9d_uxn_opcodes_h_l1056_c3_fb9d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_4303 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_da7b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1068_c3_615d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1073_c32_5270_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1073_c32_5270_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1073_c32_5270_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1073_c32_5270_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_2aca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_DUPLICATE_5e6c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1063_l1060_l1055_l1075_DUPLICATE_ba46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1070_l1075_DUPLICATE_e359_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1051_l1086_DUPLICATE_73e3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_2aca := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1078_c3_2aca;
     VAR_MUX_uxn_opcodes_h_l1073_c32_5270_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1068_c3_615d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1068_c3_615d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_4303 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1061_c3_4303;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_da7b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1065_c3_da7b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_a94b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_a94b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1073_c32_5270_iffalse := resize(to_signed(-1, 2), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1063_c11_b0b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1075_c11_afc9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_DUPLICATE_5e6c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_DUPLICATE_5e6c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1081_c11_a793] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_left;
     BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_return_output := BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1070_c11_3239] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_left;
     BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output := BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1079_c24_74fd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_left;
     BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_return_output := BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1067_c11_c32f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1055_c6_b8df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_55b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1073_c32_700a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_left;
     BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_return_output := BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1063_l1060_l1055_l1075_DUPLICATE_ba46 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1063_l1060_l1055_l1075_DUPLICATE_ba46_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1070_l1075_DUPLICATE_e359 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1070_l1075_DUPLICATE_e359_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1073_c32_700a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1055_c6_b8df_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_55b7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1063_c11_b0b5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1067_c11_c32f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1070_c11_3239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1075_c11_afc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1081_c11_a793_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1079_c24_74fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_DUPLICATE_5e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_DUPLICATE_5e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_DUPLICATE_5e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_DUPLICATE_5e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_DUPLICATE_5e6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1081_l1075_DUPLICATE_3f9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1063_l1060_l1055_l1075_DUPLICATE_ba46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1063_l1060_l1055_l1075_DUPLICATE_ba46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1063_l1060_l1055_l1075_DUPLICATE_ba46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1063_l1060_l1055_l1075_DUPLICATE_ba46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1067_l1063_l1060_l1055_l1075_DUPLICATE_ba46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1081_DUPLICATE_4f3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1070_l1075_DUPLICATE_e359_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1070_l1075_DUPLICATE_e359_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1070_l1067_l1063_l1060_l1055_l1075_DUPLICATE_7e69_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1075_c7_f203] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1073_c32_e2df] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_left;
     BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_return_output := BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1055_c1_f1e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1063_c7_0d97] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond <= VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond;
     t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue;
     t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output := t8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1081_c7_aef6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1070_c7_177c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1070_c7_177c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_cond;
     n8_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue;
     n8_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_return_output := n8_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1081_c7_aef6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1075_c7_f203] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_return_output := result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1075_c7_f203] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1073_c32_5270_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1073_c32_e2df_return_output;
     VAR_printf_uxn_opcodes_h_l1056_c3_fb9d_uxn_opcodes_h_l1056_c3_fb9d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1055_c1_f1e8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1081_c7_aef6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1070_c7_177c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;

     -- MUX[uxn_opcodes_h_l1073_c32_5270] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1073_c32_5270_cond <= VAR_MUX_uxn_opcodes_h_l1073_c32_5270_cond;
     MUX_uxn_opcodes_h_l1073_c32_5270_iftrue <= VAR_MUX_uxn_opcodes_h_l1073_c32_5270_iftrue;
     MUX_uxn_opcodes_h_l1073_c32_5270_iffalse <= VAR_MUX_uxn_opcodes_h_l1073_c32_5270_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1073_c32_5270_return_output := MUX_uxn_opcodes_h_l1073_c32_5270_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1075_c7_f203] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;

     -- n8_MUX[uxn_opcodes_h_l1067_c7_0794] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1067_c7_0794_cond <= VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_cond;
     n8_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue;
     n8_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_return_output := n8_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;

     -- printf_uxn_opcodes_h_l1056_c3_fb9d[uxn_opcodes_h_l1056_c3_fb9d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1056_c3_fb9d_uxn_opcodes_h_l1056_c3_fb9d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1056_c3_fb9d_uxn_opcodes_h_l1056_c3_fb9d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1070_c7_177c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1060_c7_3ce1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond;
     t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue;
     t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output := t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1070_c7_177c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1075_c7_f203] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue := VAR_MUX_uxn_opcodes_h_l1073_c32_5270_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1075_c7_f203_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1067_c7_0794] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;

     -- t8_MUX[uxn_opcodes_h_l1055_c2_a839] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1055_c2_a839_cond <= VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_cond;
     t8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue;
     t8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output := t8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1070_c7_177c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1067_c7_0794] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_return_output := result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1070_c7_177c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1070_c7_177c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1067_c7_0794] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;

     -- n8_MUX[uxn_opcodes_h_l1063_c7_0d97] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond <= VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_cond;
     n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue;
     n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output := n8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1070_c7_177c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1067_c7_0794] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1067_c7_0794] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;

     -- n8_MUX[uxn_opcodes_h_l1060_c7_3ce1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond;
     n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue;
     n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output := n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1063_c7_0d97] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output := result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1067_c7_0794] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1063_c7_0d97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1063_c7_0d97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1067_c7_0794_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1060_c7_3ce1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1060_c7_3ce1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1063_c7_0d97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1063_c7_0d97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1060_c7_3ce1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1063_c7_0d97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;

     -- n8_MUX[uxn_opcodes_h_l1055_c2_a839] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1055_c2_a839_cond <= VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_cond;
     n8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue;
     n8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output := n8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1063_c7_0d97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1055_c2_a839] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c7_3ce1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1055_c2_a839] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_return_output := result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1055_c2_a839] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1060_c7_3ce1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c7_3ce1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1060_c7_3ce1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1055_c2_a839] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1055_c2_a839] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1055_c2_a839] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1051_l1086_DUPLICATE_73e3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1051_l1086_DUPLICATE_73e3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1055_c2_a839_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1055_c2_a839_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1051_l1086_DUPLICATE_73e3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l1051_l1086_DUPLICATE_73e3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
