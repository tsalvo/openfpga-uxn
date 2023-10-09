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
-- Submodules: 128
entity swp2_0CLK_04f7be23 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_04f7be23;
architecture arch of swp2_0CLK_04f7be23 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2962_c6_5dfb]
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c1_4478]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2962_c2_b753]
signal t16_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2962_c2_b753]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2962_c2_b753]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2962_c2_b753]
signal result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2962_c2_b753]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2962_c2_b753]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2962_c2_b753]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2962_c2_b753]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2962_c2_b753]
signal n16_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2963_c3_b3b0[uxn_opcodes_h_l2963_c3_b3b0]
signal printf_uxn_opcodes_h_l2963_c3_b3b0_uxn_opcodes_h_l2963_c3_b3b0_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2968_c11_44a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2968_c7_7467]
signal t16_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2968_c7_7467]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2968_c7_7467]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2968_c7_7467]
signal result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2968_c7_7467]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2968_c7_7467]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2968_c7_7467]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2968_c7_7467]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2968_c7_7467]
signal n16_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2971_c11_8387]
signal BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2971_c7_c1b8]
signal n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2976_c11_849c]
signal BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal t16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2976_c7_fa52]
signal n16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2979_c11_20d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal t16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2979_c7_46d4]
signal n16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2980_c3_8c9f]
signal BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2983_c11_17cf]
signal BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2983_c7_dca4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2983_c7_dca4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2983_c7_dca4]
signal result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2983_c7_dca4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2983_c7_dca4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2983_c7_dca4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2983_c7_dca4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2983_c7_dca4]
signal n16_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2986_c11_0b2f]
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2986_c7_5602]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2986_c7_5602]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2986_c7_5602]
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c7_5602]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c7_5602]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c7_5602]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c7_5602]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2986_c7_5602]
signal n16_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_5d47]
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2991_c7_abd3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2991_c7_abd3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2991_c7_abd3]
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c7_abd3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_abd3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_abd3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_abd3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2991_c7_abd3]
signal n16_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_edef]
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2994_c7_6f56]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2994_c7_6f56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2994_c7_6f56]
signal result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2994_c7_6f56]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_6f56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_6f56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_6f56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2994_c7_6f56]
signal n16_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2995_c3_0dd6]
signal BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2998_c32_fe6d]
signal BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2998_c32_4562]
signal BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2998_c32_dced]
signal MUX_uxn_opcodes_h_l2998_c32_dced_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2998_c32_dced_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2998_c32_dced_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2998_c32_dced_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3000_c11_d79a]
signal BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3000_c7_9dfe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3000_c7_9dfe]
signal result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3000_c7_9dfe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3000_c7_9dfe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3000_c7_9dfe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3006_c11_9434]
signal BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3006_c7_0967]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3006_c7_0967]
signal result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3006_c7_0967]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3006_c7_0967]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3006_c7_0967]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3008_c34_0413]
signal CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3010_c11_184b]
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3010_c7_e398]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3010_c7_e398]
signal result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3010_c7_e398]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3010_c7_e398]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3010_c7_e398]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3015_c11_0f49]
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3015_c7_56f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3015_c7_56f6]
signal result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3015_c7_56f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3015_c7_56f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3017_c34_45a3]
signal CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3019_c11_50cf]
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3019_c7_cd1d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3019_c7_cd1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb
BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_left,
BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_right,
BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_return_output);

-- t16_MUX_uxn_opcodes_h_l2962_c2_b753
t16_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
t16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
t16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
t16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753
result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- n16_MUX_uxn_opcodes_h_l2962_c2_b753
n16_MUX_uxn_opcodes_h_l2962_c2_b753 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2962_c2_b753_cond,
n16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue,
n16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse,
n16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

-- printf_uxn_opcodes_h_l2963_c3_b3b0_uxn_opcodes_h_l2963_c3_b3b0
printf_uxn_opcodes_h_l2963_c3_b3b0_uxn_opcodes_h_l2963_c3_b3b0 : entity work.printf_uxn_opcodes_h_l2963_c3_b3b0_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2963_c3_b3b0_uxn_opcodes_h_l2963_c3_b3b0_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5
BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output);

-- t16_MUX_uxn_opcodes_h_l2968_c7_7467
t16_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
t16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
t16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
t16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467
result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- n16_MUX_uxn_opcodes_h_l2968_c7_7467
n16_MUX_uxn_opcodes_h_l2968_c7_7467 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2968_c7_7467_cond,
n16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue,
n16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse,
n16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387
BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_left,
BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_right,
BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output);

-- t16_MUX_uxn_opcodes_h_l2971_c7_c1b8
t16_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8
result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- n16_MUX_uxn_opcodes_h_l2971_c7_c1b8
n16_MUX_uxn_opcodes_h_l2971_c7_c1b8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond,
n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue,
n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse,
n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c
BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_left,
BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_right,
BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output);

-- t16_MUX_uxn_opcodes_h_l2976_c7_fa52
t16_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
t16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52
result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- n16_MUX_uxn_opcodes_h_l2976_c7_fa52
n16_MUX_uxn_opcodes_h_l2976_c7_fa52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond,
n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue,
n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse,
n16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output);

-- t16_MUX_uxn_opcodes_h_l2979_c7_46d4
t16_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
t16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- n16_MUX_uxn_opcodes_h_l2979_c7_46d4
n16_MUX_uxn_opcodes_h_l2979_c7_46d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond,
n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue,
n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse,
n16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f
BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_left,
BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_right,
BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf
BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_left,
BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_right,
BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4
result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output);

-- n16_MUX_uxn_opcodes_h_l2983_c7_dca4
n16_MUX_uxn_opcodes_h_l2983_c7_dca4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2983_c7_dca4_cond,
n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue,
n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse,
n16_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_left,
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_right,
BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602
result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_cond,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_return_output);

-- n16_MUX_uxn_opcodes_h_l2986_c7_5602
n16_MUX_uxn_opcodes_h_l2986_c7_5602 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2986_c7_5602_cond,
n16_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue,
n16_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse,
n16_MUX_uxn_opcodes_h_l2986_c7_5602_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_left,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_right,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3
result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_cond,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output);

-- n16_MUX_uxn_opcodes_h_l2991_c7_abd3
n16_MUX_uxn_opcodes_h_l2991_c7_abd3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2991_c7_abd3_cond,
n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue,
n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse,
n16_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_left,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_right,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56
result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_cond,
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output);

-- n16_MUX_uxn_opcodes_h_l2994_c7_6f56
n16_MUX_uxn_opcodes_h_l2994_c7_6f56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2994_c7_6f56_cond,
n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue,
n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse,
n16_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6
BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_left,
BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_right,
BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d
BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_left,
BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_right,
BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562
BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_left,
BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_right,
BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_return_output);

-- MUX_uxn_opcodes_h_l2998_c32_dced
MUX_uxn_opcodes_h_l2998_c32_dced : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2998_c32_dced_cond,
MUX_uxn_opcodes_h_l2998_c32_dced_iftrue,
MUX_uxn_opcodes_h_l2998_c32_dced_iffalse,
MUX_uxn_opcodes_h_l2998_c32_dced_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a
BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_left,
BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_right,
BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe
result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe
result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond,
result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe
result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe
result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434
BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_left,
BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_right,
BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967
result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967
result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_cond,
result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967
result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967
result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3008_c34_0413
CONST_SR_8_uxn_opcodes_h_l3008_c34_0413 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_x,
CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_left,
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_right,
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398
result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_cond,
result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_left,
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_right,
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6
result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3
CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_x,
CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_left,
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_right,
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a
CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_return_output,
 t16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 n16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output,
 t16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 n16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output,
 t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output,
 t16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 n16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output,
 t16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 n16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output,
 n16_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_return_output,
 n16_MUX_uxn_opcodes_h_l2986_c7_5602_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output,
 n16_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output,
 n16_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_return_output,
 MUX_uxn_opcodes_h_l2998_c32_dced_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_return_output,
 CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output,
 CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_5673 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2963_c3_b3b0_uxn_opcodes_h_l2963_c3_b3b0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_0f43 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2974_c3_21f7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_8e73 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2981_c3_f523 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2984_c3_859c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2989_c3_46a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_0300 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2998_c32_dced_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2998_c32_dced_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2998_c32_dced_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2998_c32_dced_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3003_c3_b9bf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3004_c24_08c9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_4d1c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c24_3dab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_3ba4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3013_c24_6c9c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_cf9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c24_3b96_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l2980_l2972_l2987_DUPLICATE_526a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l3015_DUPLICATE_502e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3024_l2958_DUPLICATE_fe0a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_right := to_unsigned(11, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_cf9d := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_cf9d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_0300 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_0300;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2974_c3_21f7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2974_c3_21f7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_8e73 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_8e73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2989_c3_46a1 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2989_c3_46a1;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2998_c32_dced_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2984_c3_859c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2984_c3_859c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_3ba4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_3ba4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2981_c3_f523 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2981_c3_f523;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3003_c3_b9bf := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3003_c3_b9bf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_5673 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_5673;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_right := to_unsigned(12, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_0f43 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2969_c3_0f43;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2998_c32_dced_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_4d1c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_4d1c;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := t16;
     -- CONST_SR_8[uxn_opcodes_h_l3008_c34_0413] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_return_output := CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3000_c11_d79a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3004_c24_08c9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3004_c24_08c9_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l3015_DUPLICATE_502e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l3015_DUPLICATE_502e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2998_c32_fe6d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_left;
     BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_return_output := BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l2980_l2972_l2987_DUPLICATE_526a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l2980_l2972_l2987_DUPLICATE_526a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2976_c11_849c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3013_c24_6c9c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3013_c24_6c9c_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2971_c11_8387] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_left;
     BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output := BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2968_c11_44a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3015_c11_0f49] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_left;
     BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output := BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2979_c11_20d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3019_c11_50cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2986_c11_0b2f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2962_c6_5dfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_5d47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_left;
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output := BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l3010_c11_184b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3006_c11_9434] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_left;
     BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output := BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3017_c34_45a3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_return_output := CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2983_c11_17cf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_left;
     BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output := BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_edef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_left;
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output := BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2998_c32_fe6d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2962_c6_5dfb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2968_c11_44a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2971_c11_8387_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2976_c11_849c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_20d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2983_c11_17cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c11_0b2f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_5d47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_edef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3000_c11_d79a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3006_c11_9434_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_184b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_0f49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_50cf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l2980_l2972_l2987_DUPLICATE_526a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l2980_l2972_l2987_DUPLICATE_526a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l2980_l2972_l2987_DUPLICATE_526a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3004_c24_08c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3013_c24_6c9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_9b3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2968_l3019_l2991_l3015_l2986_l3010_l2983_l3006_l2979_l3000_l2976_l2994_l2971_DUPLICATE_aad9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2968_l2991_l2962_l2986_l3010_l2983_l3006_l2979_l2976_l2971_DUPLICATE_e01c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2968_l2991_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_312a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2968_l3019_l2991_l2962_l3015_l2986_l3010_l2983_l3006_l2979_l2976_l2994_l2971_DUPLICATE_3599_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l3015_DUPLICATE_502e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2994_l3015_DUPLICATE_502e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2968_l2991_l2962_l3015_l2986_l2983_l2979_l2976_l2994_l2971_DUPLICATE_791a_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l2998_c32_4562] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_left;
     BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_return_output := BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2994_c7_6f56] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3008_c24_3dab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c24_3dab_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3008_c34_0413_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2995_c3_0dd6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_left;
     BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_return_output := BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3010_c7_e398] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3017_c24_3b96] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c24_3b96_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3017_c34_45a3_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3019_c7_cd1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2980_c3_8c9f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_left;
     BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_return_output := BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3019_c7_cd1d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3015_c7_56f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2962_c1_4478] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2998_c32_dced_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2998_c32_4562_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2980_c3_8c9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2995_c3_0dd6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c24_3dab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c24_3b96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2988_l2973_DUPLICATE_d98a_return_output;
     VAR_printf_uxn_opcodes_h_l2963_c3_b3b0_uxn_opcodes_h_l2963_c3_b3b0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2962_c1_4478_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_cd1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3010_c7_e398] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3015_c7_56f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output;

     -- MUX[uxn_opcodes_h_l2998_c32_dced] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2998_c32_dced_cond <= VAR_MUX_uxn_opcodes_h_l2998_c32_dced_cond;
     MUX_uxn_opcodes_h_l2998_c32_dced_iftrue <= VAR_MUX_uxn_opcodes_h_l2998_c32_dced_iftrue;
     MUX_uxn_opcodes_h_l2998_c32_dced_iffalse <= VAR_MUX_uxn_opcodes_h_l2998_c32_dced_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2998_c32_dced_return_output := MUX_uxn_opcodes_h_l2998_c32_dced_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3015_c7_56f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2994_c7_6f56] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2994_c7_6f56_cond <= VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_cond;
     n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue;
     n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output := n16_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2991_c7_abd3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3015_c7_56f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3006_c7_0967] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;

     -- t16_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := t16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- printf_uxn_opcodes_h_l2963_c3_b3b0[uxn_opcodes_h_l2963_c3_b3b0] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2963_c3_b3b0_uxn_opcodes_h_l2963_c3_b3b0_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2963_c3_b3b0_uxn_opcodes_h_l2963_c3_b3b0_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue := VAR_MUX_uxn_opcodes_h_l2998_c32_dced_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3015_c7_56f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     -- t16_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := t16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3006_c7_0967] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3000_c7_9dfe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2994_c7_6f56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3010_c7_e398] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3010_c7_e398] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_return_output := result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;

     -- n16_MUX[uxn_opcodes_h_l2991_c7_abd3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2991_c7_abd3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_cond;
     n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue;
     n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output := n16_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2986_c7_5602] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3010_c7_e398] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3010_c7_e398_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     -- n16_MUX[uxn_opcodes_h_l2986_c7_5602] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2986_c7_5602_cond <= VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_cond;
     n16_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue;
     n16_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_return_output := n16_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2991_c7_abd3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2983_c7_dca4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3006_c7_0967] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_return_output := result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3006_c7_0967] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2994_c7_6f56] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3006_c7_0967] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;

     -- t16_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3000_c7_9dfe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3006_c7_0967_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3000_c7_9dfe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3000_c7_9dfe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output := result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;

     -- t16_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     t16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     t16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := t16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_6f56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;

     -- n16_MUX[uxn_opcodes_h_l2983_c7_dca4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2983_c7_dca4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_cond;
     n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue;
     n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output := n16_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c7_abd3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2986_c7_5602] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3000_c7_9dfe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3000_c7_9dfe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_abd3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := n16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2994_c7_6f56] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output := result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c7_5602] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_6f56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_6f56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2983_c7_dca4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     t16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     t16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := t16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2994_c7_6f56_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2991_c7_abd3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output := result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := n16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2983_c7_dca4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_abd3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c7_5602] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_abd3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2991_c7_abd3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2983_c7_dca4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c7_5602] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2986_c7_5602] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_return_output := result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c7_5602] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;

     -- n16_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2986_c7_5602_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2983_c7_dca4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     n16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     n16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := n16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2983_c7_dca4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2983_c7_dca4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2983_c7_dca4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     n16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     n16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := n16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2979_c7_46d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_46d4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2976_c7_fa52] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output := result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2976_c7_fa52_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2971_c7_c1b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2971_c7_c1b8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2968_c7_7467] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_return_output := result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2968_c7_7467_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2962_c2_b753] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_return_output := result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3024_l2958_DUPLICATE_fe0a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3024_l2958_DUPLICATE_fe0a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2962_c2_b753_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2962_c2_b753_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3024_l2958_DUPLICATE_fe0a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3024_l2958_DUPLICATE_fe0a_return_output;
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
