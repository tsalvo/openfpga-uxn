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
-- Submodules: 64
entity and_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_fd2391e7;
architecture arch of and_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l789_c6_8b57]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l789_c1_9a5d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l789_c2_0967]
signal t8_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c2_0967]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l789_c2_0967]
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c2_0967]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c2_0967]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c2_0967]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c2_0967]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l789_c2_0967]
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l789_c2_0967]
signal n8_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l790_c3_4f28[uxn_opcodes_h_l790_c3_4f28]
signal printf_uxn_opcodes_h_l790_c3_4f28_uxn_opcodes_h_l790_c3_4f28_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l795_c11_5849]
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l795_c7_8da5]
signal t8_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l795_c7_8da5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l795_c7_8da5]
signal result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c7_8da5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l795_c7_8da5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l795_c7_8da5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c7_8da5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l795_c7_8da5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l795_c7_8da5]
signal n8_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l798_c11_0444]
signal BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l798_c7_7595]
signal t8_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l798_c7_7595]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l798_c7_7595]
signal result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l798_c7_7595]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l798_c7_7595]
signal result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l798_c7_7595]
signal result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l798_c7_7595]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l798_c7_7595]
signal result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l798_c7_7595]
signal n8_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l802_c11_aee9]
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l802_c7_f044]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l802_c7_f044]
signal result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_f044]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l802_c7_f044]
signal result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_f044]
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_f044]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l802_c7_f044]
signal result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l802_c7_f044]
signal n8_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l805_c11_53f3]
signal BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l805_c7_f4db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l805_c7_f4db]
signal result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l805_c7_f4db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l805_c7_f4db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l805_c7_f4db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l805_c7_f4db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l805_c7_f4db]
signal result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l805_c7_f4db]
signal n8_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l809_c32_8a67]
signal BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l809_c32_ed02]
signal BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l809_c32_b327]
signal MUX_uxn_opcodes_h_l809_c32_b327_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l809_c32_b327_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l809_c32_b327_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l809_c32_b327_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l811_c11_4eeb]
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l811_c7_1c06]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l811_c7_1c06]
signal result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_1c06]
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_1c06]
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_1c06]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l815_c24_ac46]
signal BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l817_c11_6afe]
signal BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l817_c7_a7f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l817_c7_a7f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57
BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_return_output);

-- t8_MUX_uxn_opcodes_h_l789_c2_0967
t8_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l789_c2_0967_cond,
t8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
t8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
t8_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967
result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_cond,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- n8_MUX_uxn_opcodes_h_l789_c2_0967
n8_MUX_uxn_opcodes_h_l789_c2_0967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l789_c2_0967_cond,
n8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue,
n8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse,
n8_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

-- printf_uxn_opcodes_h_l790_c3_4f28_uxn_opcodes_h_l790_c3_4f28
printf_uxn_opcodes_h_l790_c3_4f28_uxn_opcodes_h_l790_c3_4f28 : entity work.printf_uxn_opcodes_h_l790_c3_4f28_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l790_c3_4f28_uxn_opcodes_h_l790_c3_4f28_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849
BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_left,
BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_right,
BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output);

-- t8_MUX_uxn_opcodes_h_l795_c7_8da5
t8_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
t8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
t8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
t8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5
result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5
result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- n8_MUX_uxn_opcodes_h_l795_c7_8da5
n8_MUX_uxn_opcodes_h_l795_c7_8da5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l795_c7_8da5_cond,
n8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue,
n8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse,
n8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444
BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_left,
BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_right,
BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output);

-- t8_MUX_uxn_opcodes_h_l798_c7_7595
t8_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l798_c7_7595_cond,
t8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
t8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
t8_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595
result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_cond,
result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- n8_MUX_uxn_opcodes_h_l798_c7_7595
n8_MUX_uxn_opcodes_h_l798_c7_7595 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l798_c7_7595_cond,
n8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue,
n8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse,
n8_MUX_uxn_opcodes_h_l798_c7_7595_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9
BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_left,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_right,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044
result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044
result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_cond,
result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044
result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_return_output);

-- n8_MUX_uxn_opcodes_h_l802_c7_f044
n8_MUX_uxn_opcodes_h_l802_c7_f044 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l802_c7_f044_cond,
n8_MUX_uxn_opcodes_h_l802_c7_f044_iftrue,
n8_MUX_uxn_opcodes_h_l802_c7_f044_iffalse,
n8_MUX_uxn_opcodes_h_l802_c7_f044_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3
BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_left,
BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_right,
BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db
result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_cond,
result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_return_output);

-- n8_MUX_uxn_opcodes_h_l805_c7_f4db
n8_MUX_uxn_opcodes_h_l805_c7_f4db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l805_c7_f4db_cond,
n8_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue,
n8_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse,
n8_MUX_uxn_opcodes_h_l805_c7_f4db_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67
BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_left,
BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_right,
BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02
BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_left,
BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_right,
BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_return_output);

-- MUX_uxn_opcodes_h_l809_c32_b327
MUX_uxn_opcodes_h_l809_c32_b327 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l809_c32_b327_cond,
MUX_uxn_opcodes_h_l809_c32_b327_iftrue,
MUX_uxn_opcodes_h_l809_c32_b327_iffalse,
MUX_uxn_opcodes_h_l809_c32_b327_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb
BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_left,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_right,
BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06
result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06
result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_cond,
result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46
BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_left,
BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_right,
BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe
BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_left,
BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_right,
BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2
result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_return_output,
 t8_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 n8_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output,
 t8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 n8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output,
 t8_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 n8_MUX_uxn_opcodes_h_l798_c7_7595_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_return_output,
 n8_MUX_uxn_opcodes_h_l802_c7_f044_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_return_output,
 n8_MUX_uxn_opcodes_h_l805_c7_f4db_return_output,
 BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_return_output,
 BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_return_output,
 MUX_uxn_opcodes_h_l809_c32_b327_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_return_output,
 BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l792_c3_10bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l790_c3_4f28_uxn_opcodes_h_l790_c3_4f28_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l796_c3_c890 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_a385 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l803_c3_f902 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l809_c32_b327_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l809_c32_b327_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l809_c32_b327_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l809_c32_b327_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_3da9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l798_l811_l789_l795_l802_DUPLICATE_b8f0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l798_l805_l789_l795_l802_DUPLICATE_8174_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l798_l805_l795_l802_DUPLICATE_4c47_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l805_l811_DUPLICATE_f98a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l785_l822_DUPLICATE_3dbc_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l803_c3_f902 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l803_c3_f902;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_3da9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l814_c3_3da9;
     VAR_MUX_uxn_opcodes_h_l809_c32_b327_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l809_c32_b327_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_a385 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_a385;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l792_c3_10bd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l792_c3_10bd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l796_c3_c890 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l796_c3_c890;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l798_l805_l795_l802_DUPLICATE_4c47 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l798_l805_l795_l802_DUPLICATE_4c47_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l795_c11_5849] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_left;
     BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output := BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l805_c11_53f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l815_c24_ac46] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_left;
     BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_return_output := BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l817_c11_6afe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_left;
     BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_return_output := BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l798_l805_l789_l795_l802_DUPLICATE_8174 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l798_l805_l789_l795_l802_DUPLICATE_8174_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l809_c32_8a67] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_left;
     BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_return_output := BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c6_8b57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l805_l811_DUPLICATE_f98a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l805_l811_DUPLICATE_f98a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l802_c11_aee9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_left;
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output := BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l811_c11_4eeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l798_c11_0444] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_left;
     BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output := BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l798_l811_l789_l795_l802_DUPLICATE_b8f0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l798_l811_l789_l795_l802_DUPLICATE_b8f0_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_left := VAR_BIN_OP_AND_uxn_opcodes_h_l809_c32_8a67_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l815_c24_ac46_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c6_8b57_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_5849_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l798_c11_0444_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_aee9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_53f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l811_c11_4eeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l817_c11_6afe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l798_l805_l789_l795_l802_DUPLICATE_8174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l798_l805_l789_l795_l802_DUPLICATE_8174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l798_l805_l789_l795_l802_DUPLICATE_8174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l798_l805_l789_l795_l802_DUPLICATE_8174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l798_l805_l789_l795_l802_DUPLICATE_8174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l798_l805_l811_l817_l795_l802_DUPLICATE_e142_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l798_l811_l789_l795_l802_DUPLICATE_b8f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l798_l811_l789_l795_l802_DUPLICATE_b8f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l798_l811_l789_l795_l802_DUPLICATE_b8f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l798_l811_l789_l795_l802_DUPLICATE_b8f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l798_l811_l789_l795_l802_DUPLICATE_b8f0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l798_l805_l795_l802_DUPLICATE_4c47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l798_l805_l795_l802_DUPLICATE_4c47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l798_l805_l795_l802_DUPLICATE_4c47_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l798_l805_l795_l802_DUPLICATE_4c47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l798_l805_l817_l789_l795_l802_DUPLICATE_f7e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l805_l811_DUPLICATE_f98a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l805_l811_DUPLICATE_f98a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l798_l805_l811_l789_l795_l802_DUPLICATE_32b4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l811_c7_1c06] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;

     -- n8_MUX[uxn_opcodes_h_l805_c7_f4db] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l805_c7_f4db_cond <= VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_cond;
     n8_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue;
     n8_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_return_output := n8_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l811_c7_1c06] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l811_c7_1c06] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_cond;
     result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_return_output := result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l817_c7_a7f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output;

     -- t8_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     t8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     t8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_return_output := t8_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l817_c7_a7f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l789_c1_9a5d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l805_c7_f4db] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l809_c32_ed02] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_left;
     BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_return_output := BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l809_c32_b327_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l809_c32_ed02_return_output;
     VAR_printf_uxn_opcodes_h_l790_c3_4f28_uxn_opcodes_h_l790_c3_4f28_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l789_c1_9a5d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_iffalse := VAR_n8_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l817_c7_a7f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l802_c7_f044] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l811_c7_1c06] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;

     -- t8_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     t8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     t8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := t8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l805_c7_f4db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;

     -- printf_uxn_opcodes_h_l790_c3_4f28[uxn_opcodes_h_l790_c3_4f28] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l790_c3_4f28_uxn_opcodes_h_l790_c3_4f28_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l790_c3_4f28_uxn_opcodes_h_l790_c3_4f28_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l809_c32_b327] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l809_c32_b327_cond <= VAR_MUX_uxn_opcodes_h_l809_c32_b327_cond;
     MUX_uxn_opcodes_h_l809_c32_b327_iftrue <= VAR_MUX_uxn_opcodes_h_l809_c32_b327_iftrue;
     MUX_uxn_opcodes_h_l809_c32_b327_iffalse <= VAR_MUX_uxn_opcodes_h_l809_c32_b327_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l809_c32_b327_return_output := MUX_uxn_opcodes_h_l809_c32_b327_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l805_c7_f4db] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_cond;
     result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_return_output := result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l805_c7_f4db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;

     -- n8_MUX[uxn_opcodes_h_l802_c7_f044] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l802_c7_f044_cond <= VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_cond;
     n8_MUX_uxn_opcodes_h_l802_c7_f044_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_iftrue;
     n8_MUX_uxn_opcodes_h_l802_c7_f044_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_return_output := n8_MUX_uxn_opcodes_h_l802_c7_f044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l811_c7_1c06] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue := VAR_MUX_uxn_opcodes_h_l809_c32_b327_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := VAR_n8_MUX_uxn_opcodes_h_l802_c7_f044_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l802_c7_f044_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l811_c7_1c06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_t8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l805_c7_f4db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_f044] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_return_output;

     -- t8_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     t8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     t8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_return_output := t8_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l805_c7_f4db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;

     -- n8_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     n8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     n8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_return_output := n8_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l802_c7_f044] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l802_c7_f044] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_cond;
     result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_return_output := result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l805_c7_f4db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_f4db_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_f044_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l802_c7_f044_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l789_c2_0967_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_return_output := result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_f044] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l802_c7_f044] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_f044] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- n8_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     n8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     n8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := n8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_n8_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_f044_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l802_c7_f044_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_f044_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- n8_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     n8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     n8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_return_output := n8_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l798_c7_7595] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l789_c2_0967_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l798_c7_7595_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_return_output := result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l795_c7_8da5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_8da5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c2_0967] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l785_l822_DUPLICATE_3dbc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l785_l822_DUPLICATE_3dbc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c2_0967_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l789_c2_0967_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l785_l822_DUPLICATE_3dbc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l785_l822_DUPLICATE_3dbc_return_output;
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
