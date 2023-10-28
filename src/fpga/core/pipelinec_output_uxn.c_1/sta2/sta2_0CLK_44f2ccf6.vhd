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
-- Submodules: 106
entity sta2_0CLK_44f2ccf6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_44f2ccf6;
architecture arch of sta2_0CLK_44f2ccf6 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2486_c6_e336]
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2486_c1_40fb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2486_c2_0599]
signal t16_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2486_c2_0599]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2486_c2_0599]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2486_c2_0599]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2486_c2_0599]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2486_c2_0599]
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2486_c2_0599]
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2486_c2_0599]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2486_c2_0599]
signal n16_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2487_c3_ad18[uxn_opcodes_h_l2487_c3_ad18]
signal printf_uxn_opcodes_h_l2487_c3_ad18_uxn_opcodes_h_l2487_c3_ad18_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2491_c11_6d76]
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2491_c7_a244]
signal t16_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2491_c7_a244]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2491_c7_a244]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2491_c7_a244]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2491_c7_a244]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2491_c7_a244]
signal result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2491_c7_a244]
signal result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2491_c7_a244]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2491_c7_a244]
signal n16_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2494_c11_3bb0]
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2494_c7_dc7c]
signal n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2499_c11_bd16]
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2499_c7_d7aa]
signal n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2502_c11_39a2]
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal t16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2502_c7_29ce]
signal n16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2503_c3_7f22]
signal BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2506_c11_1340]
signal BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2506_c7_3c97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2506_c7_3c97]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2506_c7_3c97]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2506_c7_3c97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2506_c7_3c97]
signal result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2506_c7_3c97]
signal result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2506_c7_3c97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2506_c7_3c97]
signal n16_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_4e84]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_fb90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2509_c7_fb90]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_fb90]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_fb90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2509_c7_fb90]
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_fb90]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_fb90]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_fb90]
signal n16_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2514_c11_9d3f]
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2514_c7_3c04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2514_c7_3c04]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2514_c7_3c04]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2514_c7_3c04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2514_c7_3c04]
signal result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2514_c7_3c04]
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2514_c7_3c04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2514_c7_3c04]
signal n16_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_26e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2517_c7_57f5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_57f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_57f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2517_c7_57f5]
signal result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_57f5]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_57f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_57f5]
signal n16_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2518_c3_f465]
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2520_c30_9970]
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2523_c31_783a]
signal CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_d801]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2525_c7_6240]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2525_c7_6240]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_6240]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2525_c7_6240]
signal result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_6240]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2527_c22_cbbf]
signal BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2530_c11_923a]
signal BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2530_c7_77f8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2530_c7_77f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5abb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336
BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_left,
BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_right,
BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_return_output);

-- t16_MUX_uxn_opcodes_h_l2486_c2_0599
t16_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
t16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
t16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
t16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599
result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599
result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- n16_MUX_uxn_opcodes_h_l2486_c2_0599
n16_MUX_uxn_opcodes_h_l2486_c2_0599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2486_c2_0599_cond,
n16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue,
n16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse,
n16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

-- printf_uxn_opcodes_h_l2487_c3_ad18_uxn_opcodes_h_l2487_c3_ad18
printf_uxn_opcodes_h_l2487_c3_ad18_uxn_opcodes_h_l2487_c3_ad18 : entity work.printf_uxn_opcodes_h_l2487_c3_ad18_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2487_c3_ad18_uxn_opcodes_h_l2487_c3_ad18_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_left,
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_right,
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output);

-- t16_MUX_uxn_opcodes_h_l2491_c7_a244
t16_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
t16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
t16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
t16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244
result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244
result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- n16_MUX_uxn_opcodes_h_l2491_c7_a244
n16_MUX_uxn_opcodes_h_l2491_c7_a244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2491_c7_a244_cond,
n16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue,
n16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse,
n16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_left,
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_right,
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output);

-- t16_MUX_uxn_opcodes_h_l2494_c7_dc7c
t16_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- n16_MUX_uxn_opcodes_h_l2494_c7_dc7c
n16_MUX_uxn_opcodes_h_l2494_c7_dc7c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond,
n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue,
n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse,
n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_left,
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_right,
BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output);

-- t16_MUX_uxn_opcodes_h_l2499_c7_d7aa
t16_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa
result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa
result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa
result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2499_c7_d7aa
n16_MUX_uxn_opcodes_h_l2499_c7_d7aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond,
n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue,
n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse,
n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_left,
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_right,
BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output);

-- t16_MUX_uxn_opcodes_h_l2502_c7_29ce
t16_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
t16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce
result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce
result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- n16_MUX_uxn_opcodes_h_l2502_c7_29ce
n16_MUX_uxn_opcodes_h_l2502_c7_29ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond,
n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue,
n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse,
n16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22
BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_left,
BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_right,
BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340
BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_left,
BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_right,
BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97
result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97
result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond,
result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97
result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond,
result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output);

-- n16_MUX_uxn_opcodes_h_l2506_c7_3c97
n16_MUX_uxn_opcodes_h_l2506_c7_3c97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2506_c7_3c97_cond,
n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue,
n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse,
n16_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_fb90
n16_MUX_uxn_opcodes_h_l2509_c7_fb90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_fb90_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_left,
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_right,
BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04
result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond,
result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond,
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output);

-- n16_MUX_uxn_opcodes_h_l2514_c7_3c04
n16_MUX_uxn_opcodes_h_l2514_c7_3c04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2514_c7_3c04_cond,
n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue,
n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse,
n16_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5
result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5
result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_57f5
n16_MUX_uxn_opcodes_h_l2517_c7_57f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_57f5_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465
BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_left,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_right,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2520_c30_9970
sp_relative_shift_uxn_opcodes_h_l2520_c30_9970 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_ins,
sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_x,
sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_y,
sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2523_c31_783a
CONST_SR_8_uxn_opcodes_h_l2523_c31_783a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_x,
CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240
result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond,
result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf
BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_left,
BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_right,
BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a
BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_left,
BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_right,
BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8
result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46
CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_return_output,
 t16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 n16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output,
 t16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 n16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output,
 t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output,
 t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output,
 t16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 n16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output,
 n16_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output,
 n16_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_return_output,
 sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_return_output,
 CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_176d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2487_c3_ad18_uxn_opcodes_h_l2487_c3_ad18_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_3515 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_7f41 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2500_c3_0ea2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2504_c3_4245 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_fef3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_e491 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_5f20 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2514_c7_3c04_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_0900_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2527_c3_a163 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2528_c21_61ec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2503_l2495_l2518_l2510_DUPLICATE_27fb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2535_l2482_DUPLICATE_597d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_3515 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_3515;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_y := to_signed(-4, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_fef3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_fef3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_176d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_176d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_7f41 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2497_c3_7f41;
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_right := to_unsigned(9, 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_e491 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2512_c3_e491;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2504_c3_4245 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2504_c3_4245;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_5f20 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_5f20;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2500_c3_0ea2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2500_c3_0ea2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2486_c6_e336] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_left;
     BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output := BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2514_c11_9d3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_26e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_4e84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2499_c11_bd16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_left;
     BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output := BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2491_c11_6d76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_left;
     BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output := BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2503_l2495_l2518_l2510_DUPLICATE_27fb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2503_l2495_l2518_l2510_DUPLICATE_27fb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output := result.sp_relative_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2514_c7_3c04_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_d801] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2506_c11_1340] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_left;
     BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output := BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2527_c22_cbbf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2528_c21_61ec] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2528_c21_61ec_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2494_c11_3bb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2520_c30_9970] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_ins;
     sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_x;
     sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_return_output := sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2502_c11_39a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2530_c11_923a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c6_e336_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_6d76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_3bb0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2499_c11_bd16_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2502_c11_39a2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2506_c11_1340_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_4e84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2514_c11_9d3f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_26e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_d801_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2530_c11_923a_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2527_c3_a163 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2527_c22_cbbf_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2503_l2495_l2518_l2510_DUPLICATE_27fb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2503_l2495_l2518_l2510_DUPLICATE_27fb_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2503_l2495_l2518_l2510_DUPLICATE_27fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2528_c21_61ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2494_l2517_l2491_l2514_l2486_l2509_DUPLICATE_0a03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_b789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2517_l2491_l2514_l2509_DUPLICATE_2afa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2506_l2502_l2530_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_e2cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_66fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2506_l2502_l2499_l2525_l2494_l2491_l2514_l2486_l2509_DUPLICATE_72fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2520_c30_9970_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2527_c3_a163;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_57f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_6240] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2525_c7_6240] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2486_c1_40fb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2518_c3_f465] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_left;
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_return_output := BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2530_c7_77f8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2530_c7_77f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2525_c7_6240] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output := result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2503_c3_7f22] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_left;
     BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_return_output := BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2503_c3_7f22_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_f465_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2511_l2496_DUPLICATE_3c46_return_output;
     VAR_printf_uxn_opcodes_h_l2487_c3_ad18_uxn_opcodes_h_l2487_c3_ad18_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2486_c1_40fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2530_c7_77f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_6240] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;

     -- t16_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := t16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2517_c7_57f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_fb90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;

     -- n16_MUX[uxn_opcodes_h_l2517_c7_57f5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_57f5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2525_c7_6240] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2517_c7_57f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;

     -- printf_uxn_opcodes_h_l2487_c3_ad18[uxn_opcodes_h_l2487_c3_ad18] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2487_c3_ad18_uxn_opcodes_h_l2487_c3_ad18_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2487_c3_ad18_uxn_opcodes_h_l2487_c3_ad18_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CONST_SR_8[uxn_opcodes_h_l2523_c31_783a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_return_output := CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_6240_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2523_c21_0900] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_0900_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2523_c31_783a_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2506_c7_3c97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;

     -- t16_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_fb90] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output := result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;

     -- n16_MUX[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2514_c7_3c04_cond <= VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_cond;
     n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue;
     n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output := n16_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_57f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2517_c7_57f5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_0900_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2506_c7_3c97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_57f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_fb90] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_fb90_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;

     -- t16_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_fb90] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2509_c7_fb90] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output := result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_57f5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2506_c7_3c97] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2506_c7_3c97] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output := result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2509_c7_fb90] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_fb90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;

     -- n16_MUX[uxn_opcodes_h_l2506_c7_3c97] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2506_c7_3c97_cond <= VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_cond;
     n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue;
     n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output := n16_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2514_c7_3c04] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output := result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- t16_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     t16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     t16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := t16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2514_c7_3c04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2506_c7_3c97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;

     -- n16_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := n16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     t16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     t16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := t16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2506_c7_3c97] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_fb90] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_fb90_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2506_c7_3c97] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output := result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2506_c7_3c97_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2502_c7_29ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2502_c7_29ce_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2499_c7_d7aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- n16_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     n16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     n16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := n16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2499_c7_d7aa_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2494_c7_dc7c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- n16_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     n16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     n16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := n16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_dc7c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2491_c7_a244] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output := result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2491_c7_a244_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2486_c2_0599] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output := result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2535_l2482_DUPLICATE_597d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2535_l2482_DUPLICATE_597d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5abb(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c2_0599_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c2_0599_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2535_l2482_DUPLICATE_597d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l2535_l2482_DUPLICATE_597d_return_output;
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
