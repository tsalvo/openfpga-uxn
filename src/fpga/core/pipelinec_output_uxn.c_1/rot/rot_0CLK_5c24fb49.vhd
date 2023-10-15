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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 87
entity rot_0CLK_5c24fb49 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_5c24fb49;
architecture arch of rot_0CLK_5c24fb49 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2891_c6_bc4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2891_c2_ca6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_ffd8]
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2896_c7_e586]
signal l8_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2896_c7_e586]
signal n8_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2896_c7_e586]
signal t8_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2896_c7_e586]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2896_c7_e586]
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2896_c7_e586]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2896_c7_e586]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2896_c7_e586]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2896_c7_e586]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_d311]
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2899_c7_c445]
signal l8_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2899_c7_c445]
signal n8_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2899_c7_c445]
signal t8_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2899_c7_c445]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2899_c7_c445]
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2899_c7_c445]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2899_c7_c445]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2899_c7_c445]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2899_c7_c445]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_cb66]
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2903_c7_7ee0]
signal l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2903_c7_7ee0]
signal n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2903_c7_7ee0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2903_c7_7ee0]
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2903_c7_7ee0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2903_c7_7ee0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2903_c7_7ee0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2903_c7_7ee0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_f28d]
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2906_c7_03b9]
signal l8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2906_c7_03b9]
signal n8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2906_c7_03b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2906_c7_03b9]
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2906_c7_03b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2906_c7_03b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_03b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_03b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_c715]
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2910_c7_ab61]
signal l8_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2910_c7_ab61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2910_c7_ab61]
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2910_c7_ab61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2910_c7_ab61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2910_c7_ab61]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2910_c7_ab61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_7a8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l2913_c7_9dd4]
signal l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2913_c7_9dd4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2913_c7_9dd4]
signal result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2913_c7_9dd4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2913_c7_9dd4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2913_c7_9dd4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2913_c7_9dd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2916_c32_2324]
signal BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2916_c32_f241]
signal BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2916_c32_802f]
signal MUX_uxn_opcodes_h_l2916_c32_802f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2916_c32_802f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2916_c32_802f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2916_c32_802f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_b8b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2918_c7_d98e]
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2918_c7_d98e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2918_c7_d98e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2918_c7_d98e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2918_c7_d98e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_fce2]
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2924_c7_ad3e]
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2924_c7_ad3e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2924_c7_ad3e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2924_c7_ad3e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_991c]
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2928_c7_6a68]
signal result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2928_c7_6a68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2928_c7_6a68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2928_c7_6a68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_a667]
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2932_c7_3e44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2932_c7_3e44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d
BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output);

-- l8_MUX_uxn_opcodes_h_l2891_c2_ca6e
l8_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- n8_MUX_uxn_opcodes_h_l2891_c2_ca6e
n8_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- t8_MUX_uxn_opcodes_h_l2891_c2_ca6e
t8_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_left,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_right,
BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output);

-- l8_MUX_uxn_opcodes_h_l2896_c7_e586
l8_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
l8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
l8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
l8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- n8_MUX_uxn_opcodes_h_l2896_c7_e586
n8_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
n8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
n8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
n8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- t8_MUX_uxn_opcodes_h_l2896_c7_e586
t8_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
t8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
t8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
t8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_left,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_right,
BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output);

-- l8_MUX_uxn_opcodes_h_l2899_c7_c445
l8_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
l8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
l8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
l8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- n8_MUX_uxn_opcodes_h_l2899_c7_c445
n8_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
n8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
n8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
n8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- t8_MUX_uxn_opcodes_h_l2899_c7_c445
t8_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
t8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
t8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
t8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_left,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_right,
BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output);

-- l8_MUX_uxn_opcodes_h_l2903_c7_7ee0
l8_MUX_uxn_opcodes_h_l2903_c7_7ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond,
l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue,
l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse,
l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output);

-- n8_MUX_uxn_opcodes_h_l2903_c7_7ee0
n8_MUX_uxn_opcodes_h_l2903_c7_7ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond,
n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue,
n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse,
n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_left,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_right,
BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output);

-- l8_MUX_uxn_opcodes_h_l2906_c7_03b9
l8_MUX_uxn_opcodes_h_l2906_c7_03b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond,
l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue,
l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse,
l8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output);

-- n8_MUX_uxn_opcodes_h_l2906_c7_03b9
n8_MUX_uxn_opcodes_h_l2906_c7_03b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond,
n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue,
n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse,
n8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_left,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_right,
BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output);

-- l8_MUX_uxn_opcodes_h_l2910_c7_ab61
l8_MUX_uxn_opcodes_h_l2910_c7_ab61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2910_c7_ab61_cond,
l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue,
l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse,
l8_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_cond,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output);

-- l8_MUX_uxn_opcodes_h_l2913_c7_9dd4
l8_MUX_uxn_opcodes_h_l2913_c7_9dd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond,
l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue,
l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse,
l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324
BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_left,
BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_right,
BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241
BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_left,
BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_right,
BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_return_output);

-- MUX_uxn_opcodes_h_l2916_c32_802f
MUX_uxn_opcodes_h_l2916_c32_802f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2916_c32_802f_cond,
MUX_uxn_opcodes_h_l2916_c32_802f_iftrue,
MUX_uxn_opcodes_h_l2916_c32_802f_iffalse,
MUX_uxn_opcodes_h_l2916_c32_802f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_left,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_right,
BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_left,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_right,
BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_cond,
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_left,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_right,
BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output,
 l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output,
 l8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 n8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 t8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output,
 l8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 n8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 t8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output,
 l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output,
 n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output,
 l8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output,
 n8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output,
 l8_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output,
 l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_return_output,
 MUX_uxn_opcodes_h_l2916_c32_802f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_00d1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_82d0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_a695 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_6f33 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_df93 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2911_c3_cb7e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2916_c32_802f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2916_c32_802f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2916_c32_802f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2916_c32_802f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_cd78 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_549f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_d27e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_3df9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2937_l2887_DUPLICATE_4523_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_cd78 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2921_c3_cd78;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_a695 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2901_c3_a695;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_00d1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2893_c3_00d1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_right := to_unsigned(8, 4);
     VAR_MUX_uxn_opcodes_h_l2916_c32_802f_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_df93 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2908_c3_df93;
     VAR_MUX_uxn_opcodes_h_l2916_c32_802f_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_549f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2925_c3_549f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_6f33 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2904_c3_6f33;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2911_c3_cb7e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2911_c3_cb7e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_82d0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2897_c3_82d0;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_d27e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2929_c3_d27e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_left := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse := l8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue := l8;
     VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2913_c11_7a8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_3df9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_3df9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2932_c11_a667] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_left;
     BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_return_output := BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2924_c11_fce2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2899_c11_d311] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_left;
     BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output := BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2891_c6_bc4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2916_c32_2324] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_left;
     BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_return_output := BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2896_c11_ffd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2903_c11_cb66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_left;
     BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output := BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2928_c11_991c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2910_c11_c715] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_left;
     BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output := BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2918_c11_b8b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2906_c11_f28d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2916_c32_2324_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2891_c6_bc4d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2896_c11_ffd8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2899_c11_d311_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2903_c11_cb66_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2906_c11_f28d_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2910_c11_c715_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2913_c11_7a8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2918_c11_b8b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2924_c11_fce2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2928_c11_991c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2932_c11_a667_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2899_l2896_DUPLICATE_83ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_l2918_DUPLICATE_9dee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2891_l2910_l2906_l2903_l2899_l2896_l2918_DUPLICATE_f20f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2932_l2903_l2928_l2899_l2924_l2896_DUPLICATE_cf23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_3df9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2913_l2928_DUPLICATE_3df9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2891_l2913_l2910_l2906_l2903_l2928_l2899_l2896_DUPLICATE_4ac0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2928_c7_6a68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output;

     -- l8_MUX[uxn_opcodes_h_l2913_c7_9dd4] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond <= VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond;
     l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue;
     l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output := l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2932_c7_3e44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2928_c7_6a68] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output := result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2932_c7_3e44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2916_c32_f241] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_left;
     BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_return_output := BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_return_output;

     -- n8_MUX[uxn_opcodes_h_l2906_c7_03b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond;
     n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue;
     n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output := n8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2918_c7_d98e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     t8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     t8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := t8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2916_c32_802f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2916_c32_f241_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2932_c7_3e44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     -- MUX[uxn_opcodes_h_l2916_c32_802f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2916_c32_802f_cond <= VAR_MUX_uxn_opcodes_h_l2916_c32_802f_cond;
     MUX_uxn_opcodes_h_l2916_c32_802f_iftrue <= VAR_MUX_uxn_opcodes_h_l2916_c32_802f_iftrue;
     MUX_uxn_opcodes_h_l2916_c32_802f_iffalse <= VAR_MUX_uxn_opcodes_h_l2916_c32_802f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2916_c32_802f_return_output := MUX_uxn_opcodes_h_l2916_c32_802f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2928_c7_6a68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output;

     -- l8_MUX[uxn_opcodes_h_l2910_c7_ab61] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2910_c7_ab61_cond <= VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_cond;
     l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue;
     l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output := l8_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2928_c7_6a68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2924_c7_ad3e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2913_c7_9dd4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2903_c7_7ee0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond;
     n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue;
     n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output := n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2924_c7_ad3e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     t8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     t8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := t8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue := VAR_MUX_uxn_opcodes_h_l2916_c32_802f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2928_c7_6a68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2918_c7_d98e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2924_c7_ad3e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2924_c7_ad3e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     n8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     n8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := n8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2918_c7_d98e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2913_c7_9dd4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2910_c7_ab61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;

     -- l8_MUX[uxn_opcodes_h_l2906_c7_03b9] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_cond;
     l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue;
     l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output := l8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2924_c7_ad3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2918_c7_d98e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2906_c7_03b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2910_c7_ab61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2913_c7_9dd4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     n8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     n8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := n8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2918_c7_d98e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2913_c7_9dd4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;

     -- l8_MUX[uxn_opcodes_h_l2903_c7_7ee0] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond <= VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond;
     l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue;
     l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output := l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2918_c7_d98e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2910_c7_ab61] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output := result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2906_c7_03b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2903_c7_7ee0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;

     -- l8_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     l8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     l8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := l8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2913_c7_9dd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2910_c7_ab61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;

     -- n8_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2913_c7_9dd4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2913_c7_9dd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2910_c7_ab61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2906_c7_03b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2903_c7_7ee0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2910_c7_ab61] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2906_c7_03b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;

     -- l8_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     l8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     l8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := l8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_l8_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2910_c7_ab61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2906_c7_03b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2903_c7_7ee0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2906_c7_03b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;

     -- l8_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2903_c7_7ee0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2906_c7_03b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2903_c7_7ee0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2903_c7_7ee0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2903_c7_7ee0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2899_c7_c445] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2899_c7_c445_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2896_c7_e586] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2896_c7_e586_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2891_c2_ca6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2937_l2887_DUPLICATE_4523 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2937_l2887_DUPLICATE_4523_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2891_c2_ca6e_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2937_l2887_DUPLICATE_4523_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l2937_l2887_DUPLICATE_4523_return_output;
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
