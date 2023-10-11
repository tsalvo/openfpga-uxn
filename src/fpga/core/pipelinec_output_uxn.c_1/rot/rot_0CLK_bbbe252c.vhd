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
-- Submodules: 89
entity rot_0CLK_bbbe252c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_bbbe252c;
architecture arch of rot_0CLK_bbbe252c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2891_c6_409c]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_9a75]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal n8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal l8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal t8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2891_c2_09ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2892_c3_d516[uxn_opcodes_h_l2892_c3_d516]
signal printf_uxn_opcodes_h_l2892_c3_d516_uxn_opcodes_h_l2892_c3_d516_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_9d5c]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2896_c7_5b0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_b72f]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal n8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal l8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal t8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2899_c7_9f80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_267e]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2903_c7_185b]
signal n8_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2903_c7_185b]
signal l8_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2903_c7_185b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2903_c7_185b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2903_c7_185b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2903_c7_185b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2903_c7_185b]
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2903_c7_185b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_35bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2906_c7_62a8]
signal n8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l2906_c7_62a8]
signal l8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_62a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2906_c7_62a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2906_c7_62a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2906_c7_62a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2906_c7_62a8]
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_62a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_1890]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2910_c7_8900]
signal l8_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2910_c7_8900]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2910_c7_8900]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2910_c7_8900]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2910_c7_8900]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2910_c7_8900]
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2910_c7_8900]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_0495]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2913_c7_667f]
signal l8_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2913_c7_667f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2913_c7_667f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2913_c7_667f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2913_c7_667f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2913_c7_667f]
signal result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2913_c7_667f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2916_c32_99db]
signal BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2916_c32_3a8e]
signal BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2916_c32_089b]
signal MUX_uxn_opcodes_h_l2916_c32_089b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2916_c32_089b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2916_c32_089b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2916_c32_089b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_ab70]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2918_c7_1fd9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2918_c7_1fd9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2918_c7_1fd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2918_c7_1fd9]
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2918_c7_1fd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_1188]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2924_c7_5ba8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2924_c7_5ba8]
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2924_c7_5ba8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2924_c7_5ba8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_d0ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2928_c7_86e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2928_c7_86e3]
signal result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2928_c7_86e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2928_c7_86e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_bc58]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2932_c7_6366]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2932_c7_6366]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c
BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_return_output);

-- n8_MUX_uxn_opcodes_h_l2891_c2_09ed
n8_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
n8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- l8_MUX_uxn_opcodes_h_l2891_c2_09ed
l8_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
l8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- t8_MUX_uxn_opcodes_h_l2891_c2_09ed
t8_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
t8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

-- printf_uxn_opcodes_h_l2892_c3_d516_uxn_opcodes_h_l2892_c3_d516
printf_uxn_opcodes_h_l2892_c3_d516_uxn_opcodes_h_l2892_c3_d516 : entity work.printf_uxn_opcodes_h_l2892_c3_d516_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2892_c3_d516_uxn_opcodes_h_l2892_c3_d516_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output);

-- n8_MUX_uxn_opcodes_h_l2896_c7_5b0c
n8_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- l8_MUX_uxn_opcodes_h_l2896_c7_5b0c
l8_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- t8_MUX_uxn_opcodes_h_l2896_c7_5b0c
t8_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output);

-- n8_MUX_uxn_opcodes_h_l2899_c7_9f80
n8_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
n8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- l8_MUX_uxn_opcodes_h_l2899_c7_9f80
l8_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
l8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- t8_MUX_uxn_opcodes_h_l2899_c7_9f80
t8_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
t8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output);

-- n8_MUX_uxn_opcodes_h_l2903_c7_185b
n8_MUX_uxn_opcodes_h_l2903_c7_185b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2903_c7_185b_cond,
n8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue,
n8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse,
n8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output);

-- l8_MUX_uxn_opcodes_h_l2903_c7_185b
l8_MUX_uxn_opcodes_h_l2903_c7_185b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2903_c7_185b_cond,
l8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue,
l8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse,
l8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output);

-- n8_MUX_uxn_opcodes_h_l2906_c7_62a8
n8_MUX_uxn_opcodes_h_l2906_c7_62a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond,
n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue,
n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse,
n8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output);

-- l8_MUX_uxn_opcodes_h_l2906_c7_62a8
l8_MUX_uxn_opcodes_h_l2906_c7_62a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond,
l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue,
l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse,
l8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output);

-- l8_MUX_uxn_opcodes_h_l2910_c7_8900
l8_MUX_uxn_opcodes_h_l2910_c7_8900 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2910_c7_8900_cond,
l8_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue,
l8_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse,
l8_MUX_uxn_opcodes_h_l2910_c7_8900_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_cond,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output);

-- l8_MUX_uxn_opcodes_h_l2913_c7_667f
l8_MUX_uxn_opcodes_h_l2913_c7_667f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2913_c7_667f_cond,
l8_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue,
l8_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse,
l8_MUX_uxn_opcodes_h_l2913_c7_667f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db
BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_left,
BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_right,
BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e
BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_left,
BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_right,
BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_return_output);

-- MUX_uxn_opcodes_h_l2916_c32_089b
MUX_uxn_opcodes_h_l2916_c32_089b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2916_c32_089b_cond,
MUX_uxn_opcodes_h_l2916_c32_089b_iftrue,
MUX_uxn_opcodes_h_l2916_c32_089b_iffalse,
MUX_uxn_opcodes_h_l2916_c32_089b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_return_output,
 n8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 l8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 t8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output,
 n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output,
 n8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 l8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 t8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output,
 n8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output,
 l8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output,
 n8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output,
 l8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output,
 l8_MUX_uxn_opcodes_h_l2910_c7_8900_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output,
 l8_MUX_uxn_opcodes_h_l2913_c7_667f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_return_output,
 MUX_uxn_opcodes_h_l2916_c32_089b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_5b2e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2892_c3_d516_uxn_opcodes_h_l2892_c3_d516_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_c36b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_b432 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_1280 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_9cc6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2911_c3_9de0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2916_c32_089b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2916_c32_089b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2916_c32_089b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2916_c32_089b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_d1c8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_80b6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_d3aa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_198a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2937_l2887_DUPLICATE_396d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_d1c8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_d1c8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_9cc6 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_9cc6;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_1280 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_1280;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_d3aa := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_d3aa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_80b6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_80b6;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2916_c32_089b_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_b432 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_b432;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2911_c3_9de0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2911_c3_9de0;
     VAR_MUX_uxn_opcodes_h_l2916_c32_089b_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_c36b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_c36b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_5b2e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_5b2e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_left := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse := l8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_b72f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_1188] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_ab70] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c6_409c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_267e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_9d5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_35bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_1890] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2916_c32_99db] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_left;
     BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_return_output := BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_d0ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_198a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_198a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_bc58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_0495] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_99db_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_409c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_9d5c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_b72f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_267e_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_35bd_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_1890_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_0495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_ab70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_1188_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_d0ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_bc58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_567b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2918_l2913_l2910_l2906_DUPLICATE_eca6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2903_l2899_l2896_l2918_l2891_l2910_l2906_DUPLICATE_5cd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2932_l2903_l2928_l2899_l2924_l2896_l2891_l2913_l2910_l2906_DUPLICATE_1aa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_198a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_198a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2903_l2928_l2899_l2896_l2891_l2913_l2910_l2906_DUPLICATE_596c_return_output;
     -- t8_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := t8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2916_c32_3a8e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_left;
     BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_return_output := BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2906_c7_62a8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond;
     n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue;
     n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output := n8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2932_c7_6366] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2928_c7_86e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2891_c1_9a75] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_return_output;

     -- l8_MUX[uxn_opcodes_h_l2913_c7_667f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2913_c7_667f_cond <= VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_cond;
     l8_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue;
     l8_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_return_output := l8_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2918_c7_1fd9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2928_c7_86e3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2932_c7_6366] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2916_c32_089b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_3a8e_return_output;
     VAR_printf_uxn_opcodes_h_l2892_c3_d516_uxn_opcodes_h_l2892_c3_d516_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2891_c1_9a75_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_6366_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_6366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2928_c7_86e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2924_c7_5ba8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output;

     -- l8_MUX[uxn_opcodes_h_l2910_c7_8900] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2910_c7_8900_cond <= VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_cond;
     l8_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue;
     l8_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_return_output := l8_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;

     -- MUX[uxn_opcodes_h_l2916_c32_089b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2916_c32_089b_cond <= VAR_MUX_uxn_opcodes_h_l2916_c32_089b_cond;
     MUX_uxn_opcodes_h_l2916_c32_089b_iftrue <= VAR_MUX_uxn_opcodes_h_l2916_c32_089b_iftrue;
     MUX_uxn_opcodes_h_l2916_c32_089b_iffalse <= VAR_MUX_uxn_opcodes_h_l2916_c32_089b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2916_c32_089b_return_output := MUX_uxn_opcodes_h_l2916_c32_089b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2924_c7_5ba8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output;

     -- printf_uxn_opcodes_h_l2892_c3_d516[uxn_opcodes_h_l2892_c3_d516] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2892_c3_d516_uxn_opcodes_h_l2892_c3_d516_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2892_c3_d516_uxn_opcodes_h_l2892_c3_d516_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2913_c7_667f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2928_c7_86e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output;

     -- n8_MUX[uxn_opcodes_h_l2903_c7_185b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2903_c7_185b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_cond;
     n8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue;
     n8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output := n8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue := VAR_MUX_uxn_opcodes_h_l2916_c32_089b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_86e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     -- n8_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := n8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2924_c7_5ba8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2918_c7_1fd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2918_c7_1fd9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2924_c7_5ba8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := t8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- l8_MUX[uxn_opcodes_h_l2906_c7_62a8] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_cond;
     l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue;
     l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output := l8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2910_c7_8900] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2913_c7_667f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_5ba8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2918_c7_1fd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;

     -- l8_MUX[uxn_opcodes_h_l2903_c7_185b] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2903_c7_185b_cond <= VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_cond;
     l8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue;
     l8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output := l8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2910_c7_8900] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2918_c7_1fd9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2913_c7_667f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2913_c7_667f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2906_c7_62a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_1fd9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2906_c7_62a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2910_c7_8900] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;

     -- n8_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := n8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2913_c7_667f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2903_c7_185b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2910_c7_8900] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_return_output := result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;

     -- l8_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := l8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2913_c7_667f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_667f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2906_c7_62a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2903_c7_185b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2910_c7_8900] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;

     -- l8_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2906_c7_62a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2910_c7_8900] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_8900_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_62a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2903_c7_185b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2903_c7_185b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_62a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;

     -- l8_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := l8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_62a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2903_c7_185b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2903_c7_185b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_185b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2899_c7_9f80] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_9f80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2896_c7_5b0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_5b0c_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2891_c2_09ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2937_l2887_DUPLICATE_396d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2937_l2887_DUPLICATE_396d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_09ed_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2937_l2887_DUPLICATE_396d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2937_l2887_DUPLICATE_396d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
