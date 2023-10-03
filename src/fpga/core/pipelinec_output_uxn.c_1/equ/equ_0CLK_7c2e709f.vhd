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
-- Submodules: 65
entity equ_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ_0CLK_7c2e709f;
architecture arch of equ_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l838_c6_33f3]
signal BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l838_c1_3e2d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l838_c2_8abe]
signal t8_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l838_c2_8abe]
signal n8_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l838_c2_8abe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c2_8abe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l838_c2_8abe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l838_c2_8abe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c2_8abe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c2_8abe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l838_c2_8abe]
signal result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l839_c3_04af[uxn_opcodes_h_l839_c3_04af]
signal printf_uxn_opcodes_h_l839_c3_04af_uxn_opcodes_h_l839_c3_04af_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l844_c11_cd30]
signal BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l844_c7_a96d]
signal t8_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l844_c7_a96d]
signal n8_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l844_c7_a96d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l844_c7_a96d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l844_c7_a96d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l844_c7_a96d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l844_c7_a96d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l844_c7_a96d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l844_c7_a96d]
signal result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l847_c11_c1d5]
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal t8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(15 downto 0);
signal t8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal n8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l847_c7_3fd1]
signal result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l851_c11_2bd6]
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l851_c7_8173]
signal n8_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l851_c7_8173]
signal result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_8173]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_8173]
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_8173]
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_8173]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_8173]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l851_c7_8173]
signal result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l854_c11_f464]
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l854_c7_6634]
signal n8_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(15 downto 0);
signal n8_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l854_c7_6634]
signal result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_6634]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_6634]
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_6634]
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l854_c7_6634]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_6634]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l854_c7_6634]
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l858_c32_c8fb]
signal BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l858_c32_baae]
signal BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l858_c32_e656]
signal MUX_uxn_opcodes_h_l858_c32_e656_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l858_c32_e656_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l858_c32_e656_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l858_c32_e656_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l860_c11_3cac]
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_39b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_39b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_39b3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_39b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l860_c7_39b3]
signal result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l864_c24_dd78]
signal BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l864_c24_eab1]
signal MUX_uxn_opcodes_h_l864_c24_eab1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l864_c24_eab1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l864_c24_eab1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l864_c24_eab1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_1231]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_697a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_697a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3
BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_left,
BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_right,
BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_return_output);

-- t8_MUX_uxn_opcodes_h_l838_c2_8abe
t8_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
t8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
t8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
t8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- n8_MUX_uxn_opcodes_h_l838_c2_8abe
n8_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
n8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
n8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
n8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe
result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe
result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe
result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe
result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_cond,
result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

-- printf_uxn_opcodes_h_l839_c3_04af_uxn_opcodes_h_l839_c3_04af
printf_uxn_opcodes_h_l839_c3_04af_uxn_opcodes_h_l839_c3_04af : entity work.printf_uxn_opcodes_h_l839_c3_04af_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l839_c3_04af_uxn_opcodes_h_l839_c3_04af_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30
BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_left,
BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_right,
BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output);

-- t8_MUX_uxn_opcodes_h_l844_c7_a96d
t8_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
t8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
t8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
t8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- n8_MUX_uxn_opcodes_h_l844_c7_a96d
n8_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
n8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
n8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
n8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d
result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d
result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_cond,
result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5
BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_left,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_right,
BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output);

-- t8_MUX_uxn_opcodes_h_l847_c7_3fd1
t8_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
t8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- n8_MUX_uxn_opcodes_h_l847_c7_3fd1
n8_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
n8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1
result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1
result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_cond,
result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6
BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_left,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_right,
BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output);

-- n8_MUX_uxn_opcodes_h_l851_c7_8173
n8_MUX_uxn_opcodes_h_l851_c7_8173 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l851_c7_8173_cond,
n8_MUX_uxn_opcodes_h_l851_c7_8173_iftrue,
n8_MUX_uxn_opcodes_h_l851_c7_8173_iffalse,
n8_MUX_uxn_opcodes_h_l851_c7_8173_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173
result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173
result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_cond,
result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464
BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_left,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_right,
BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output);

-- n8_MUX_uxn_opcodes_h_l854_c7_6634
n8_MUX_uxn_opcodes_h_l854_c7_6634 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l854_c7_6634_cond,
n8_MUX_uxn_opcodes_h_l854_c7_6634_iftrue,
n8_MUX_uxn_opcodes_h_l854_c7_6634_iffalse,
n8_MUX_uxn_opcodes_h_l854_c7_6634_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634
result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_cond,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb
BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_left,
BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_right,
BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l858_c32_baae
BIN_OP_GT_uxn_opcodes_h_l858_c32_baae : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_left,
BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_right,
BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_return_output);

-- MUX_uxn_opcodes_h_l858_c32_e656
MUX_uxn_opcodes_h_l858_c32_e656 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l858_c32_e656_cond,
MUX_uxn_opcodes_h_l858_c32_e656_iftrue,
MUX_uxn_opcodes_h_l858_c32_e656_iffalse,
MUX_uxn_opcodes_h_l858_c32_e656_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac
BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_left,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_right,
BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3
result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_cond,
result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78
BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_left,
BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_right,
BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_return_output);

-- MUX_uxn_opcodes_h_l864_c24_eab1
MUX_uxn_opcodes_h_l864_c24_eab1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l864_c24_eab1_cond,
MUX_uxn_opcodes_h_l864_c24_eab1_iftrue,
MUX_uxn_opcodes_h_l864_c24_eab1_iffalse,
MUX_uxn_opcodes_h_l864_c24_eab1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231
BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_return_output,
 t8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 n8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output,
 t8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 n8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output,
 t8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 n8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output,
 n8_MUX_uxn_opcodes_h_l851_c7_8173_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output,
 n8_MUX_uxn_opcodes_h_l854_c7_6634_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_return_output,
 BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_return_output,
 MUX_uxn_opcodes_h_l858_c32_e656_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_return_output,
 MUX_uxn_opcodes_h_l864_c24_eab1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_e143 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l839_c3_04af_uxn_opcodes_h_l839_c3_04af_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_86ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(15 downto 0);
 variable VAR_t8_uxn_opcodes_h_l848_c3_3172 : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(15 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_80d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l852_c3_5eca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(15 downto 0);
 variable VAR_n8_uxn_opcodes_h_l855_c3_1ab9 : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(15 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l858_c32_e656_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l858_c32_e656_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l858_c32_e656_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l858_c32_e656_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_1e1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l864_c24_eab1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l864_c24_eab1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l864_c24_eab1_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l864_c24_eab1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_DUPLICATE_5d1e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l860_l851_l847_l844_l838_DUPLICATE_90d4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l847_l851_l844_l854_DUPLICATE_02a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l854_DUPLICATE_724c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l834_l871_DUPLICATE_db51_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_e143 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l841_c3_e143;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l858_c32_e656_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l864_c24_eab1_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_80d0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l849_c3_80d0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l852_c3_5eca := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l852_c3_5eca;
     VAR_MUX_uxn_opcodes_h_l864_c24_eab1_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_86ab := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l845_c3_86ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l858_c32_e656_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_1e1b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_1e1b;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_left := VAR_phase;
     VAR_n8_uxn_opcodes_h_l855_c3_1ab9 := resize(VAR_previous_stack_read, 16);
     VAR_t8_uxn_opcodes_h_l848_c3_3172 := resize(VAR_previous_stack_read, 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := t8;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_iftrue := VAR_n8_uxn_opcodes_h_l855_c3_1ab9;
     VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := VAR_t8_uxn_opcodes_h_l848_c3_3172;
     -- BIN_OP_EQ[uxn_opcodes_h_l854_c11_f464] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_left;
     BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output := BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l860_c11_3cac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_left;
     BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output := BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l864_c24_dd78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_left;
     BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_return_output := BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_DUPLICATE_5d1e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_DUPLICATE_5d1e_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l860_l851_l847_l844_l838_DUPLICATE_90d4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l860_l851_l847_l844_l838_DUPLICATE_90d4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l854_DUPLICATE_724c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l854_DUPLICATE_724c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l851_c11_2bd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l844_c11_cd30] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_left;
     BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output := BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l847_l851_l844_l854_DUPLICATE_02a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l847_l851_l844_l854_DUPLICATE_02a0_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l847_c11_c1d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l858_c32_c8fb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_left;
     BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_return_output := BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_1231] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l838_c6_33f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_left := VAR_BIN_OP_AND_uxn_opcodes_h_l858_c32_c8fb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l838_c6_33f3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l844_c11_cd30_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l847_c11_c1d5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l851_c11_2bd6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l854_c11_f464_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l860_c11_3cac_return_output;
     VAR_MUX_uxn_opcodes_h_l864_c24_eab1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l864_c24_dd78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_1231_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_DUPLICATE_5d1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_DUPLICATE_5d1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_DUPLICATE_5d1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_DUPLICATE_5d1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_DUPLICATE_5d1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l866_DUPLICATE_7d50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l860_l851_l847_l844_l838_DUPLICATE_90d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l860_l851_l847_l844_l838_DUPLICATE_90d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l860_l851_l847_l844_l838_DUPLICATE_90d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l860_l851_l847_l844_l838_DUPLICATE_90d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l860_l851_l847_l844_l838_DUPLICATE_90d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l847_l851_l844_l854_DUPLICATE_02a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l847_l851_l844_l854_DUPLICATE_02a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l847_l851_l844_l854_DUPLICATE_02a0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l847_l851_l844_l854_DUPLICATE_02a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l854_l851_l847_l844_l838_l866_DUPLICATE_7f22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l854_DUPLICATE_724c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l860_l854_DUPLICATE_724c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l860_l854_l851_l847_l844_l838_DUPLICATE_b6bc_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l854_c7_6634] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l838_c1_3e2d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_697a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_return_output;

     -- t8_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := t8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_697a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l860_c7_39b3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;

     -- MUX[uxn_opcodes_h_l864_c24_eab1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l864_c24_eab1_cond <= VAR_MUX_uxn_opcodes_h_l864_c24_eab1_cond;
     MUX_uxn_opcodes_h_l864_c24_eab1_iftrue <= VAR_MUX_uxn_opcodes_h_l864_c24_eab1_iftrue;
     MUX_uxn_opcodes_h_l864_c24_eab1_iffalse <= VAR_MUX_uxn_opcodes_h_l864_c24_eab1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l864_c24_eab1_return_output := MUX_uxn_opcodes_h_l864_c24_eab1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l860_c7_39b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l858_c32_baae] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_left;
     BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_return_output := BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_return_output;

     -- n8_MUX[uxn_opcodes_h_l854_c7_6634] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l854_c7_6634_cond <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_cond;
     n8_MUX_uxn_opcodes_h_l854_c7_6634_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_iftrue;
     n8_MUX_uxn_opcodes_h_l854_c7_6634_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_return_output := n8_MUX_uxn_opcodes_h_l854_c7_6634_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l858_c32_e656_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l858_c32_baae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue := VAR_MUX_uxn_opcodes_h_l864_c24_eab1_return_output;
     VAR_printf_uxn_opcodes_h_l839_c3_04af_uxn_opcodes_h_l839_c3_04af_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l838_c1_3e2d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_iffalse := VAR_n8_MUX_uxn_opcodes_h_l854_c7_6634_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_697a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l854_c7_6634_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_697a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l851_c7_8173] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_return_output;

     -- MUX[uxn_opcodes_h_l858_c32_e656] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l858_c32_e656_cond <= VAR_MUX_uxn_opcodes_h_l858_c32_e656_cond;
     MUX_uxn_opcodes_h_l858_c32_e656_iftrue <= VAR_MUX_uxn_opcodes_h_l858_c32_e656_iftrue;
     MUX_uxn_opcodes_h_l858_c32_e656_iffalse <= VAR_MUX_uxn_opcodes_h_l858_c32_e656_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l858_c32_e656_return_output := MUX_uxn_opcodes_h_l858_c32_e656_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l854_c7_6634] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l860_c7_39b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;

     -- n8_MUX[uxn_opcodes_h_l851_c7_8173] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l851_c7_8173_cond <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_cond;
     n8_MUX_uxn_opcodes_h_l851_c7_8173_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_iftrue;
     n8_MUX_uxn_opcodes_h_l851_c7_8173_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_return_output := n8_MUX_uxn_opcodes_h_l851_c7_8173_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l860_c7_39b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;

     -- t8_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     t8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     t8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := t8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- printf_uxn_opcodes_h_l839_c3_04af[uxn_opcodes_h_l839_c3_04af] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l839_c3_04af_uxn_opcodes_h_l839_c3_04af_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l839_c3_04af_uxn_opcodes_h_l839_c3_04af_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l860_c7_39b3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_return_output := result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l854_c7_6634] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue := VAR_MUX_uxn_opcodes_h_l858_c32_e656_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l851_c7_8173_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l851_c7_8173_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l854_c7_6634_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l860_c7_39b3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l851_c7_8173] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l854_c7_6634] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_return_output;

     -- n8_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := n8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- t8_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     t8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     t8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := t8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l854_c7_6634] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l854_c7_6634] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l851_c7_8173] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l854_c7_6634] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_cond;
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_return_output := result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l854_c7_6634_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l854_c7_6634_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l854_c7_6634_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l851_c7_8173_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l854_c7_6634_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l851_c7_8173] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l851_c7_8173] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l851_c7_8173] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_cond;
     result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_return_output := result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_return_output;

     -- n8_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     n8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     n8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := n8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l851_c7_8173] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l851_c7_8173_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l851_c7_8173_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l851_c7_8173_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l851_c7_8173_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l847_c7_3fd1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output := result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;

     -- n8_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     n8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     n8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := n8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l847_c7_3fd1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l844_c7_a96d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l844_c7_a96d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l838_c2_8abe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l834_l871_DUPLICATE_db51 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l834_l871_DUPLICATE_db51_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l838_c2_8abe_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l838_c2_8abe_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l834_l871_DUPLICATE_db51_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l834_l871_DUPLICATE_db51_return_output;
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
